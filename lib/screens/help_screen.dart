import 'package:flutter/material.dart';
import 'package:fuel_calculator/models/help/help_section.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class HelpScreen extends StatefulWidget {
  static const screenName = "help";
  
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final _helpSections = HelpSection.helpSections;
  final _analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {

    _analytics.logScreenView(
      screenClass: HelpScreen.screenName,
      screenName: HelpScreen.screenName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _helpSections[index].isExpanded = !isExpanded;
              });
            },
            children: HelpSection.helpSections
                .map(
                  (section) => ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(section.header),
                      );
                    },
                    body: ListTile(title: section.body),
                    isExpanded: section.isExpanded,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
