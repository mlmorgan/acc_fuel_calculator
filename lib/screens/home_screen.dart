import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'ecu_maps_screen.dart';
import 'fuel_calculator_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ACC ToolBox'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'FUEL CALCULATOR'),
              Tab(text: 'ECU MAPS'),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
            FuelCalculatorScreen(),
            EcuMapsScreen(),
          ],
        ),
      ),
    );
  }
}
