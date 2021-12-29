import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_calculator/screens/help_screen.dart';

import 'info_dialog.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/icon/app_icon.svg',
                    height: 64,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 32),
                  Text(
                    'ACC\nToolbox',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            selected: true,
            leading: Icon(Icons.build_circle_outlined),
            title: Text('Tools'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpScreen()),
              );
            },
          ),
          AboutListTile(
            child: Text('About'),
            icon: Icon(Icons.info_outline),
            applicationName: 'ACC Toolbox',
            applicationIcon: Image.asset(
              'images/icon/ic_launcher.png',
              width: 72,
            ),
            applicationVersion: '1.2.2',
            aboutBoxChildren: [
              InfoDialog(),
            ],
          )
        ],
      ),
    );
  }
}
