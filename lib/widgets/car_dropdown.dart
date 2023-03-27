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
    final useMobileLayout = shortestSide < 600;
    final showSearchBox = true;
    final searchDelay = Duration(milliseconds: 0);
    final searchFieldProps = TextFieldProps(autofocus: true);

    return Consumer<Cars>(
      builder: (ctx, cars, _) => DropdownSearch<Car>(
        selectedItem: cars.currentCar,
        items: cars.cars,
        dropdownDecoratorProps: DropDownDecoratorProps(
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
        ),
        popupProps: useMobileLayout
            ? PopupProps.menu(
                showSearchBox: showSearchBox,
                searchDelay: searchDelay,
                searchFieldProps: searchFieldProps,
                itemBuilder: _popUpItemBuilder)
            : PopupProps.dialog(
                showSearchBox: showSearchBox,
                searchDelay: searchDelay,
                searchFieldProps: searchFieldProps,
                itemBuilder: _popUpItemBuilder),
        dropdownBuilder: (context, Car? car) {
          return car != null
              ? CarDropdownMenuItem(
                  car: car,
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

  Widget _popUpItemBuilder(
    BuildContext context,
    Car? car,
    bool isSelected,
  ) {
    return car != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CarDropdownMenuItem(
              car: car,
            ),
          )
        : SizedBox();
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
