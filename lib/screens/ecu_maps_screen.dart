import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';
import '../widgets/ecu_map_group_card.dart';
import '../widgets/car_dropdown.dart';

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
                  child: Container(),
                ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
