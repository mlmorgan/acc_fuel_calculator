import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/car/group.dart';

class Category with ChangeNotifier {
  Group _category = Group.gt3;
  final sharedPrefKey = 'category';

  Future<void> getCategoryFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final rawCategory = prefs.getString(sharedPrefKey);
    if (rawCategory != null) {
      switch (rawCategory) {
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
    await prefs.setString(sharedPrefKey, newCategory.value);
  }
}
