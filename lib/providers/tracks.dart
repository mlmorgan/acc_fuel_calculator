import 'package:flutter/foundation.dart';

import '../models/car/group.dart';
import '../models/track/country.dart';
import '../models/track/track.dart';

class Tracks with ChangeNotifier {
  final _tracks = [
    Track(
      name: 'Barcelona',
      country: Country.spain,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 42, milliseconds: 627),
        Group.gt4: Duration(minutes: 1, seconds: 53, milliseconds: 400),
      },
    ),
    Track(
      name: 'Brands Hatch',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 22, milliseconds: 767),
        Group.gt4: Duration(minutes: 1, seconds: 30, milliseconds: 837),
      },
    ),
    Track(
      name: 'Donnington Park',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 27, milliseconds: 153),
        Group.gt4: Duration(minutes: 1, seconds: 35, milliseconds: 949),
      },
    ),
    Track(
      name: 'Hungaroring',
      country: Country.hungary,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 42, milliseconds: 213),
        Group.gt4: Duration(minutes: 1, seconds: 51, milliseconds: 729),
      },
    ),
    Track(
      name: 'Imola',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 40, milliseconds: 128),
        Group.gt4: Duration(minutes: 1, seconds: 49, milliseconds: 749),
      },
    ),
    Track(
      name: 'Kyalami',
      country: Country.southAfrica,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 40, milliseconds: 134),
        Group.gt4: Duration(minutes: 1, seconds: 50, milliseconds: 103),
      },
    ),
    Track(
      name: 'Laguna Seca',
      country: Country.usa,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 22, milliseconds: 38),
        Group.gt4: Duration(minutes: 1, seconds: 29, milliseconds: 670),
      },
    ),
    Track(
      name: 'Misano',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 32, milliseconds: 700),
        Group.gt4: Duration(minutes: 1, seconds: 41, milliseconds: 739),
      },
    ),
    Track(
      name: 'Monza',
      country: Country.italy,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 46, milliseconds: 110),
        Group.gt4: Duration(minutes: 1, seconds: 56, milliseconds: 220),
      },
    ),
    Track(
      name: 'Mount Panorama',
      country: Country.australia,
      records: {
        Group.gt3: Duration(minutes: 2, seconds: 0, milliseconds: 147),
        Group.gt4: Duration(minutes: 2, seconds: 13, milliseconds: 23),
      },
    ),
    Track(
      name: 'Nürburgring',
      country: Country.germany,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 52, milliseconds: 680),
        Group.gt4: Duration(minutes: 2, seconds: 3, milliseconds: 528),
      },
    ),
    Track(
      name: 'Oulton Park',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 33, milliseconds: 828),
        Group.gt4: Duration(minutes: 1, seconds: 43, milliseconds: 95),
      },
    ),
    Track(
      name: 'Paul Ricard',
      country: Country.france,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 53, milliseconds: 739),
        Group.gt4: Duration(minutes: 2, seconds: 4, milliseconds: 650),
      },
    ),
    Track(
      name: 'Silverstone',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 56, milliseconds: 826),
        Group.gt4: Duration(minutes: 2, seconds: 8, milliseconds: 316),
      },
    ),
    Track(
      name: 'Snetterton',
      country: Country.unitedKingdom,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 46, milliseconds: 869),
        Group.gt4: Duration(minutes: 1, seconds: 57, milliseconds: 699),
      },
    ),
    Track(
      name: 'Spa-Francorchamps',
      country: Country.belgium,
      records: {
        Group.gt3: Duration(minutes: 2, seconds: 16, milliseconds: 380),
        Group.gt4: Duration(minutes: 2, seconds: 31, milliseconds: 230),
      },
    ),
    Track(
      name: 'Suzuka',
      country: Country.japan,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 58, milliseconds: 500),
        Group.gt4: Duration(minutes: 2, seconds: 10, milliseconds: 938),
      },
    ),
    Track(
      name: 'Zandvoort',
      country: Country.netherlands,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 34, milliseconds: 20),
        Group.gt4: Duration(minutes: 1, seconds: 44, milliseconds: 139),
      },
    ),
    Track(
      name: 'Zolder',
      country: Country.belgium,
      records: {
        Group.gt3: Duration(minutes: 1, seconds: 27, milliseconds: 519),
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

  void setCurrentTrack(Track newTrack) {
    _currentTrack = newTrack;
    notifyListeners();
  }
}
