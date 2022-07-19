import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class InfoDialog extends StatelessWidget {
  static const screenName = "info_dialog";
  final _analytics = FirebaseAnalytics.instance;

  _launchUrl(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    _analytics.logScreenView(
      screenClass: InfoDialog.screenName,
      screenName: InfoDialog.screenName,
    );

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
                    _launchUrl('https://raceapp.eu/LapRecords');
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
                    _launchUrl(
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
                text: 'Wheel rotation information from ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: 'Ross McGregor\'s post',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchUrl(
                        'https://traxion.gg/how-steering-lock-is-key-to-lap-time-in-assetto-corsa-competizione/');
                  },
              ),
              TextSpan(
                text: ' on Traxxion.gg.',
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
                    _launchUrl('https://www.flaticon.com/authors/freepik');
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
                    _launchUrl('https://www.flaticon.com');
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
