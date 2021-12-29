import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/ecu_profile/ecu_profile.dart';
import '../util/constants.dart';

class EcuProfiles with ChangeNotifier {
  final _sharedPrefKey = 'ecuProfile';
  final _analytics = FirebaseAnalytics.instance;

  Future<void> getEcuProfileFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final ecuProfileName = prefs.getString(_sharedPrefKey);
    if (ecuProfileName != null) {
      final ecuProfile = _ecuProfiles.firstWhere((element) {
        return element.name == ecuProfileName;
      });
      await setCurrentEcuProfile(ecuProfile);
    }
  }

  final _ecuProfiles = [
    EcuProfile(
      name: 'Aston Martin Vantage V8/V12',
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
    EcuProfile(
      name: 'Bentley Continental',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHighest fuel consumption'),
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
            EcuMap(8, 'Very slow\nLow fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'BMW M4/M6',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1,
                'Fastest\nVery high fuel consumption\nAggressive throttle map'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nLinear throttle map'),
            EcuMap(3, 'Identical to 2\nGradual throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Reserved',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(4, 'Do not use\nVery low power'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(5, 'Low power\nLow fuel consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(6, 'Fastest\nHigh fuel consumption\nWet throttle map'),
            EcuMap(
                7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
            EcuMap(8, 'Identical to 7\nDifferent wet throttle map'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Ferrari 488',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nNormal fuel consumption'),
            EcuMap(2, 'A bit slower\nLess fuel consumption'),
            EcuMap(3, 'A bit slower\nNormal fuel consumption'),
            EcuMap(4, 'Slowest\nLowest fuel consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(5, 'Fastest\nNormal fuel consumption\nWet throttle map'),
            EcuMap(6, 'A bit slower\nLess fuel consumption\nWet throttle map'),
            EcuMap(
                7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
            EcuMap(8, 'Slowest\nLowest fuel consumption\nWet throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car & Reserved',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(9, 'Very low power\nLow fuel consumption'),
            EcuMap(10, 'Similar to 9'),
            EcuMap(11, 'Similar to 9'),
            EcuMap(12, 'Similar to 9'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Ferrari 488 EVO',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1,
                'Fastest\nExtremely aggressive throttle and power delivery\nHigh fuel consumption'),
            EcuMap(2,
                'A hint slower\nVery aggressive throttle\nHigh fuel consumption'),
            EcuMap(3, 'Normal\nAggressive throttle\nNormal fuel consumption'),
            EcuMap(4,
                'Normal\nModerately aggressive throttle\nSlightly less consumption'),
            EcuMap(
                5, 'Normal\nAlmost linear throttle\nSlightly less consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(6, 'A bit slower\nLess fuel consumption\nWet throttle map'),
            EcuMap(
                7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
            EcuMap(8, 'Slowest\nLowest fuel consumption\nWet throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car & Reserved',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(9, 'Very low power\nLow fuel Consumption'),
            EcuMap(10, 'Similar to 9'),
            EcuMap(11, 'Similar to 9'),
            EcuMap(12, 'Similar to 9'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Honda NSX',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Full power\nProgressive throttle map'),
            EcuMap(2, 'Full power\nLinear throttle map'),
            EcuMap(3, 'Full power\nAggressive throttle map'),
            EcuMap(4, 'Full power\nVery aggressive throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(5, 'Full power\nProgressive throttle map'),
            EcuMap(6, 'Full power\nMore progressive throttle map'),
            EcuMap(7, 'Less power and consumption\nProgressive throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(8, 'Very slow\nLow fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Reiter Engineering R-EX',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHigh fuel consumption'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nAggressive throttle map'),
            EcuMap(3, 'Identical to 2\nProgressive throttle map'),
            EcuMap(4, 'Slowest\nLess fuel consumption\nSame throttle map as 3'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Lamborghini Huracan',
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
            EcuMap(6, 'A bit slower\nLess fuel consumption\nWet throttle map'),
            EcuMap(7, 'Identical to 6\nDifferent wet throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(8, 'Very slow map\nLow fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Emil Frey Jaguar',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nVery high consumption\nLinear throttle map'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nLinear throttle map'),
            EcuMap(3, 'Slower\nLess fuel consumption\nLinear throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(4,
                'Fastest\nVery high fuel consumption\nWet gradual throttle map'),
            EcuMap(5,
                'A bit slower\nNormal fuel consumption\nWet gradual throttle map'),
            EcuMap(
                6, 'Slower\nLess fuel consumption\nWet gradual throttle map'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Nissan GT-R',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHigh fuel consumption\nLinear throttle map'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nLinear throttle map'),
            EcuMap(3, 'Slower\nLess fuel consumption\nLinear throttle map'),
            EcuMap(4, 'Fuel saving\nLinear throttle map'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Lexus RC F',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest high fuel consumption\nLinear throttle map'),
            EcuMap(2, 'Identical to 1\nAggressive throttle map'),
            EcuMap(3, 'Identical to 1\nProgressive throttle map'),
            EcuMap(4, 'Fuel saving\nWet throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(5, 'Very slow\nLow fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'McLaren 650S',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nNormal fuel consumption'),
            EcuMap(2, 'A bit slower\nLess fuel consumption'),
            EcuMap(3, 'A bit slower\nNormal fuel consumption'),
            EcuMap(4, 'Slowest\nLowest fuel consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(5, 'Fastest\nNormal fuel consumption\nWet throttle map'),
            EcuMap(6, 'A bit slower\nLess fuel consumption\nWet throttle map'),
            EcuMap(
                7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
            EcuMap(8, 'Slowest\nLowest fuel consumption\nWet throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(9, 'Low power\nLow fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'McLaren 720S',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1,
                'Qualifying\nFastest\nAggressive throttle map\nHigh fuel consumption'),
            EcuMap(2,
                'A bit slower\nLinear throttle map\nNormal fuel consumption'),
            EcuMap(3,
                'A bit slower\nProgressive throttle map\nA bit less fuel consumption'),
            EcuMap(4,
                'Fuel save map\nLess power\nLinear throttle map\nLow fuel consumption'),
            EcuMap(5,
                'Fuel save map\nEven less power\nLinear throttle map\nEven lower fuel consumption'),
            EcuMap(6,
                'Fuel save map\nLowest power\nLinear throttle map\nLowest fuel consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'High Temp',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(7,
                'Very low power\nVery high consumption\nTo cool off engine for emergency situations'),
          ],
        ),
        EcuMapGroup(
          name: 'Damp',
          color: AppColors.wetMap,
          maps: [
            EcuMap(8,
                'Damp qualifying\nProgressive throttle map\nHigh fuel consumption'),
            EcuMap(9,
                'Damp race fuel save map\nLess power\nProgressive throttle map\nLow fuel consumption'),
          ],
        ),
        EcuMapGroup(
          name: 'Wet',
          color: AppColors.wetMap,
          maps: [
            EcuMap(
                10, 'Wet qualifying\nWet throttle map\nHigh fuel consumption'),
            EcuMap(11,
                'Wet race\nA bit slower\nWet throttle map\nNormal fuel consumption'),
            EcuMap(12,
                'Wet race\nA bit slower\nWet throttle map\nNormal fuel consumption'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Mercedes AMG',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Fastest\nHigh fuel consumption\nLinear throttle map'),
            EcuMap(2,
                'A bit slower\nNormal fuel consumption\nLinear throttle map'),
            EcuMap(3, 'Slow\nLow fuel consumption\nLinear throttle map'),
          ],
        ),
      ],
    ),
    EcuProfile(
      name: 'Porsche 991',
      groups: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1,
                'Normal power\nNormal consumption\nLeast progressive throttle map'),
            EcuMap(2,
                'Normal power\nNormal consumption\nProgressive throttle map'),
            EcuMap(
                3, 'Normal power\nNormal consumption\nAggressive throttle map'),
            EcuMap(4, 'Normal power\nNormal consumption\nLinear throttle map'),
            EcuMap(5,
                'Qualifying power\nHigh consumption\nLeast progressive throttle map'),
            EcuMap(6,
                'Qualifying power\nHigh consumption\nProgressive throttle map'),
            EcuMap(7,
                'Qualifying power\nHigh consumption\nAggressive throttle map'),
            EcuMap(
                8, 'Qualifying power\nHigh consumption\nLinear throttle map'),
            EcuMap(9, 'Low power\nLow consumption\nProgressive throttle map'),
          ],
        ),
        EcuMapGroup(
          name: 'Pace Car',
          color: AppColors.paceCarMap,
          maps: [
            EcuMap(10, 'Very slow\nLow consumption'),
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

  Future<void> setCurrentEcuProfile(EcuProfile newEcuProfile) async {
    _currentEcuProfile = newEcuProfile;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPrefKey, newEcuProfile.name);

    _analytics.logEvent(
      name: "select_ecu_profile",
      parameters: {"ecu_profile": newEcuProfile.name},
    );
  }
}
