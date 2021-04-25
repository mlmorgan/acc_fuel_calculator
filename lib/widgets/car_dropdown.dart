import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car/car.dart';
import '../providers/cars.dart';

class CarDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cars>(
      builder: (ctx, cars, _) => DropdownSearch<Car>(
        label: 'Car',
        mode: Mode.DIALOG,
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 0),
        items: cars.cars,
        itemAsString: (Car? car) {
          if (car != null) return car.name;
          return '';
        },
        onChanged: (Car? newCar) {
          if (newCar != null) cars.setCurrentCar(newCar);
        },
      ),
    );
  }
}
