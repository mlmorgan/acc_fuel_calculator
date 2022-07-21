import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/car/group.dart';

class Category with ChangeNotifier {
  Group _category = Group.gt3;
  final _sharedPrefKey = 'category';
  final _analytics = FirebaseAnalytics.instance;

  Future<void> getCategoryFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final categoryName = prefs.getString(_sharedPrefKey);
    if (categoryName != null) {
      switch (categoryName) {
        case 'GT3':
          await setCategory(Group.gt3);
          break;
        default:
          await setCategory(Group.gt4);
          break;
      }
    }
  }

  Group get category {
    return _category;
  }

  Future<void> setCategory(Group newCategory) async {
    _category = newCategory;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPrefKey, newCategory.name);

    _analytics.logEvent(
      name: "select_category",
      parameters: {"category": newCategory.name},
    );
  }
}
