import 'package:flutter/material.dart';
import 'package:fuel_calculator/models/help/help_section.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final _helpSections = HelpSection.helpSections;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
