import 'package:flutter/foundation.dart';

import '../models/car/car.dart';
import '../models/car/brand.dart';
import '../models/car/group.dart';

class Cars with ChangeNotifier {
  final _cars = [
    Car(
      category: Group.gt4,
      brand: Brand.alpine,
      name: "Alpine A110 GT4",
      year: 2018,
    ),
    Car(
      category: Group.gt3,
      brand: Brand.astonMartin,
      name: "AMR V12 Vantage GT3",
      year: 2013,
    ),
    Car(
      category: Group.gt3,
      brand: Brand.astonMartin,
      name: "AMR V8 Vantage GT3",
      year: 2019,
    ),
    Car(
      category: Group.gt4,
      brand: Brand.astonMartin,
      name: "Aston Martin Vantage GT4",
      year: 2018,
    ),
    Car(
      category: Group.gt3,
      brand: Brand.audi,
      name: "Audi R8 LMS",
      year: 2015,
    ),
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
