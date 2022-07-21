import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fuel_calculator/widgets/class_indicator.dart';
import 'package:provider/provider.dart';

import '../models/car/car.dart';
import '../providers/cars.dart';

class EcuProfileDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Consumer<Cars>(
      builder: (ctx, cars, _) => DropdownSearch<Car>(
        selectedItem: cars.currentCar,
        mode: useMobileLayout ? Mode.MENU : Mode.DIALOG,
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 0),
        dropdownBuilderSupportsNullItem: true,
        items: cars.cars,
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Car',
          contentPadding: const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
            left: 12.0,
            right: 0.0,
          ),
          border: const OutlineInputBorder(),
        ),
        searchFieldProps: TextFieldProps(
          autofocus: true,
        ),
        dropdownBuilder: (context, Car? car) {
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
          return (car != null) ? car.name : '';
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
          ClassIndicator(group: car.category)
        ],
      ),
      value: car,
    );
  }
}
