import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car/car.dart';
import '../providers/cars.dart';

class CarDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Consumer<Cars>(
      builder: (ctx, cars, _) => DropdownSearch<Car>(
        label: 'Car',
        mode: useMobileLayout ? Mode.BOTTOM_SHEET : Mode.DIALOG,
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 0),
        dropdownBuilderSupportsNullItem: true,
        items: cars.cars,
        autoFocusSearchBox: true,
        dropdownBuilder: (context, Car? car, designation) {
          return car != null
              ? CarDropdownMenuItem(
                  car: car,
                )
              : SizedBox();
        },
        popupItemBuilder: (context, Car? car, isSelected) {
          return car != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CarDropdownMenuItem(
                    car: car,
                  ),
                )
              : SizedBox();
        },
        itemAsString: (Car? car) {
          if (car != null) return car.name;
          return '';
        },
        onChanged: (Car? newCar) {
          if (newCar != null) {
            cars.setCurrentCar(newCar);
          }
        },
      ),
    );
  }
}

class CarDropdownMenuItem extends StatelessWidget {
  final Car car;
  const CarDropdownMenuItem({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Expanded(
            child: Text(car.name),
          ),
        ],
      ),
      value: car,
    );
  }
}