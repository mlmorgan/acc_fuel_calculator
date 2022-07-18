import 'package:flutter/foundation.dart';

import '../models/car/brand.dart';
import '../models/car/car.dart';
import '../models/car/group.dart';

class Cars with ChangeNotifier {
  final _cars = [
    
  ];

  Car? _currentCar;

  List<Car> get cars {
    return _cars;
  }

  Car? get currentCar {
    return _currentCar;
  }

  void setCurrentCar(Car newCar) {
    _currentCar = newCar;
    notifyListeners();
  }
}
