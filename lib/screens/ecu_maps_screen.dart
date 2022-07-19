import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';
import '../widgets/ecu_map_group_card.dart';
import '../widgets/car_dropdown.dart';
import '../widgets/wheel_rotation.dart';

class EcuMapsScreen extends StatefulWidget {
  static const screenName = "ecu_maps";

  @override
  _EcuMapsScreenState createState() => _EcuMapsScreenState();
}

class _EcuMapsScreenState extends State<EcuMapsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<Cars>(
      builder: (context, cars, child) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 8),
              child: EcuProfileDropdown(),
            ),
          ),
          if (cars.currentCar != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      "Wheel Rotation",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          if (cars.currentCar != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4,
                ),
                child: WheelRotation(
                  wheelRotation: cars.currentCar!.wheelRotation,
                ),
              ),
            ),
          if (cars.currentCar != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      "ECU Maps",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          cars.currentCar?.ecuMaps != null
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: EcuMapGroupCard(
                            ecuMapGroup: cars.currentCar!.ecuMaps![index]),
                      );
                    },
                    childCount: cars.currentCar!.ecuMaps!.length,
                  ),
                )
              : SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    child: Text("Fixed ECU Map"),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
