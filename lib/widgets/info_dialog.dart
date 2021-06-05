import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Track lap times calculated from the ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: 'RaceApp',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://raceapp.eu/LapRecords');
                  },
              ),
              TextSpan(
                text: ' database.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'ECU map information from ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: "Aristotelis' post",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch(
                        'https://www.assettocorsa.net/forum/index.php?threads/ecu-maps-implementation.54472/');
                  },
              ),
              TextSpan(
                text: ' on the Assetto Corsa forum.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Helmet outline icon made by ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: 'Freepik',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://www.flaticon.com/authors/freepik');
                  },
              ),
              TextSpan(
                text: ' from ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: 'www.flaticon.com',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://www.flaticon.com');
                  },
              ),
              TextSpan(
                text: '.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
