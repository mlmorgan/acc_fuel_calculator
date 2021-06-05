import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/ecu_profile/ecu_profile.dart';
import '../util/constants.dart';

class EcuProfiles with ChangeNotifier {
  final _ecuProfiles = [
    EcuProfile(
      name: 'Aston Martin Vantage',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHigh fuel consumption'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nAggressive throttle map'),
            EcuMap(3,
                'A bit slower\nNormal fuel consumption\nProgressive throttle map'),
            EcuMap(
                4, 'Slowest\nLess fuel consumption\nProgressive throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(5,
                'Similar to dry 2 & 3\nNormal fuel consumption\nSlightly progressive throttle map'),
            EcuMap(6,
                'A bit slower\nLess fuel consumption\nProgressive wet throttle map'),
            EcuMap(7, 'Identical to 6\nMore progressive throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(8, 'Very slow\nLow consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Audi R8',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHigh fuel consumption'),
            EcuMap(2, 'A bit slower\nNormal fuel consumption'),
            EcuMap(3, 'Identical to 2\nDifferent throttle map'),
            EcuMap(4, 'Slowest\nLess fuel consumption\nSame throttle map as 3'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(
                5, 'Fast\nNormal fuel consumption\nSlightly wet throttle map'),
            EcuMap(6, 'A bit slower\nLess fuel consumption'),
            EcuMap(7, 'Identical to 6\nDifferent throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(8, 'Very slow\nLow consumption'),
          ],
        ),
      ],
    ),
  ];

  EcuProfile? _currentEcuProfile;

  List<EcuProfile> get ecuProfiles {
    return _ecuProfiles;
  }

  EcuProfile? get currentEcuProfile {
    return _currentEcuProfile;
  }

  void setCurrentEcuProfile(EcuProfile newEcuProfile) {
    _currentEcuProfile = newEcuProfile;
    notifyListeners();
  }
}
