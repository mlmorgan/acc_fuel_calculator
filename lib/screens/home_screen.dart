import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/info_dialog.dart';
import 'ecu_maps_screen.dart';
import 'fuel_calculator_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ACC Fuel Calculator'),
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'images/icon/app_icon.svg',
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'ACC Fuel Calculator',
                  applicationIcon: Image.asset(
                    'images/icon/ic_launcher.png',
                    width: 72,
                  ),
                  applicationVersion: '1.0.0',
                  children: [
                    InfoDialog(),
                  ],
                );
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'FUEL CALCULATOR'),
              Tab(text: 'ECU MAPS'),
            ],
          ),
          // titleSpacing: 0,
          // title: TabBar(
          //   tabs: [
          //     Tab(text: 'FUEL CALCULATOR'),
          //     Tab(text: 'ECU MAPS'),
          //   ],
          // ),
        ),
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
