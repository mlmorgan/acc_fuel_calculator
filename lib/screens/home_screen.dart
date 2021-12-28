import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../widgets/app_drawer.dart';
import 'ecu_maps_screen.dart';
import 'fuel_calculator_screen.dart';

class HomeScreen extends StatelessWidget {
  static const screenName = "home";
  final _analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {

    _analytics.logScreenView(
      screenClass: HomeScreen.screenName,
      screenName: HomeScreen.screenName,
    );

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
