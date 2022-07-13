import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/car/group.dart';
import '../models/track/country.dart';
import '../models/track/track.dart';

class Tracks with ChangeNotifier {

  final _sharedPrefKey = 'track';
  final _analytics = FirebaseAnalytics.instance;


  Future<void> getTrackFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final trackName = prefs.getString(_sharedPrefKey);
    if (trackName != null) {
      final track = _tracks.firstWhere((element) {
        return element.name == trackName;
      });
      setCurrentTrack(track);
    }
  }

  final _tracks = [
    Track(
      name: 'Barcelona',
      country: Country.spain,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 42, milliseconds: 906),
        Group.gt4: Duration(minutes: 1, seconds: 53, milliseconds: 400),
      },
    ),
    Track(
      name: 'Brands Hatch',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 22, milliseconds: 285),
        Group.gt4: Duration(minutes: 1, seconds: 30, milliseconds: 837),
      },
    ),
    Track(
      name: 'Donington Park',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 25, milliseconds: 642),
        Group.gt4: Duration(minutes: 1, seconds: 35, milliseconds: 949),
      },
    ),
    Track(
      name: 'Hungaroring',
      country: Country.hungary,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 41, milliseconds: 895),
        Group.gt4: Duration(minutes: 1, seconds: 51, milliseconds: 729),
      },
    ),
    Track(
      name: 'Imola',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 40, milliseconds: 762),
        Group.gt4: Duration(minutes: 1, seconds: 49, milliseconds: 749),
      },
    ),
    Track(
      name: 'Kyalami',
      country: Country.southAfrica,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 39, milliseconds: 902),
        Group.gt4: Duration(minutes: 1, seconds: 50, milliseconds: 103),
      },
    ),
    Track(
      name: 'Laguna Seca',
      country: Country.usa,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 21, milliseconds: 202),
        Group.gt4: Duration(minutes: 1, seconds: 29, milliseconds: 670),
      },
    ),
    Track(
      name: 'Misano',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 32, milliseconds: 860),
        Group.gt4: Duration(minutes: 1, seconds: 41, milliseconds: 739),
      },
    ),
    Track(
      name: 'Monza',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 47, milliseconds: 092),
        Group.gt4: Duration(minutes: 1, seconds: 56, milliseconds: 220),
      },
    ),
    Track(
      name: 'Mount Panorama',
      country: Country.australia,
      records: {
        Group.gt3: Duration(minutes: 2, seconds: 0, milliseconds: 272),
        Group.gt4: Duration(minutes: 2, seconds: 13, milliseconds: 23),
      },
    ),
    Track(
      name: 'Nurburgring',
      country: Country.germany,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 53, milliseconds: 332),
        Group.gt4: Duration(minutes: 2, seconds: 3, milliseconds: 528),
      },
    ),
    Track(
      name: 'Oulton Park',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 32, milliseconds: 257),
        Group.gt4: Duration(minutes: 1, seconds: 43, milliseconds: 95),
      },
    ),
    Track(
      name: 'Paul Ricard',
      country: Country.france,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 53, milliseconds: 030),
        Group.gt4: Duration(minutes: 2, seconds: 4, milliseconds: 650),
      },
    ),
    Track(
      name: 'Silverstone',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 56, milliseconds: 635),
        Group.gt4: Duration(minutes: 2, seconds: 8, milliseconds: 316),
      },
    ),
    Track(
      name: 'Snetterton',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 46, milliseconds: 385),
        Group.gt4: Duration(minutes: 1, seconds: 57, milliseconds: 699),
      },
    ),
    Track(
      name: 'Spa-Francorchamps',
      country: Country.belgium,
      records: {
        Group.gt3: Duration(minutes: 2, seconds: 15, milliseconds: 927),
        Group.gt4: Duration(minutes: 2, seconds: 31, milliseconds: 230),
      },
    ),
    Track(
      name: 'Suzuka',
      country: Country.japan,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 58, milliseconds: 877),
        Group.gt4: Duration(minutes: 2, seconds: 10, milliseconds: 938),
      },
    ),
    Track(
      name: 'Zandvoort',
      country: Country.netherlands,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 34, milliseconds: 345),
        Group.gt4: Duration(minutes: 1, seconds: 44, milliseconds: 139),
      },
    ),
    Track(
      name: 'Zolder',
      country: Country.belgium,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 27, milliseconds: 322),
        Group.gt4: Duration(minutes: 1, seconds: 35, milliseconds: 742),
      },
    ),
  ];

  Track? _currentTrack;

  List<Track> get tracks {
    return _tracks;
  }

  Track? get currentTrack {
    return _currentTrack;
  }

  Future<void> setCurrentTrack(Track newTrack) async {
    _currentTrack = newTrack;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPrefKey, newTrack.name);

    _analytics.logEvent(
      name: "select_track",
      parameters: {"track": newTrack.name},
    );
  }
}
