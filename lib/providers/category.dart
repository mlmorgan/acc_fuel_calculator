import 'package:flutter/foundation.dart';

import '../models/car/group.dart';

class Category with ChangeNotifier {
  Group _category = Group.gt3;

  Group get category {
    return _category;
  }

  void setCategory(Group newCategory) {
    _category = newCategory;
    notifyListeners();
  }
}