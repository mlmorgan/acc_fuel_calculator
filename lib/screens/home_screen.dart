import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/banner_ad.dart';
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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('ACC ToolBox'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'FUEL CALCULATOR'),
                Tab(text: 'CAR DATA'),
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
          bottomNavigationBar:
              kIsWeb ? SizedBox.shrink() : SafeArea(child: BannerAdWidget()),
        ),
      ),
    );
  }
}
