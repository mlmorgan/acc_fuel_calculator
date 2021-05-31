import 'package:flutter/material.dart';

class HelpSection {
  final String header;
  final Text body;
  bool isExpanded;

  HelpSection(this.header, this.body, {this.isExpanded = false});

  static final helpSections = [
    HelpSection(
      'How do I know my Litres/Lap?',
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Rough estimate\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  '''From the garage, enter the setup menu and select the "Fuel and Strategy" tab. At the bottom of the "Fuel and Tyre" box there is a fuel per lap estimate.\n\nAt the start of a session, you can use this value as a very rough guide. Typically, it is an overestimate and not very accurate.\n\nFor this reason I would advise against using this initial value for the race if possible and perform the steps below to get an accurate estimate for your fuel calculation.\n\n''',
            ),
            TextSpan(
              text: 'Accurate value\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'During a practice or qualifying session, start running some laps with the ECU map you will use most for the race.\n\nAfter a couple of laps you will have enough data to get a good estimate for your fuel consumption.\n\nThere are multiple places to view this:\n\n1. In the spedometer section of the HUD there is a Fuel/Lap reading.\n\n2. In cockpit view, some cars have a fuel calculation display in the dashboard.\n\n3. In the setup menu, under "Fuel and Strategy" and in the "Fuel and Tyres" box.\n\nThis value resets every session so be sure to take note of the estimate before the session changes.\n',
            ),
          ],
        ),
      ),
    ),
    HelpSection(
      'What do the different fuel amounts mean?',
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Minimum\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Zero reserve fuel. Recommended for qualifying to keep excess weight to a minimum.\n\n',
            ),
            TextSpan(
              text: 'Recommended\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'One lap of reserve fuel. Recommended for race use to allow for small variations in your fuel consumption caused by changing track conditions.\n\n',
            ),
            TextSpan(
              text: 'Safe\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Two laps of reserve fuel. Recommended for races with a full formation lap, or when you just want extra peace of mind.\n',
            ),
          ],
        ),
      ),
    ),
    HelpSection(
      'How do track conditions affect fuel consumption?',
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'You will have lower fuel consumption on a wet track due to the slower average speed. Make sure you take this into account if there are different conditions across sessions.\n\nIf the track is dry across sessions, you will have slightly higher fuel consumption as the race weekend goes on as the track rubbers in and gets faster.\n',
            ),
          ],
        ),
      ),
    ),
    HelpSection(
      'How do I use the ECU Map reference?',
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'Changing ECU Maps allows you to change your power and throttle map on the fly. Higher power means more fuel consumption. Different throttle maps can help with car control according to your preference or the current track conditions.\n\nECU Maps can be changed either from the setup menu, the electronics page of the MFD, or with an assigned button.\n',
            ),
          ],
        ),
      ),
    ),
  ];
}
