import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/car/car.dart';
import '../models/car/group.dart';
import '../models/ecu_map/ecu_map.dart';
import '../models/ecu_map/ecu_map_group.dart';
import '../util/constants.dart';

class Cars with ChangeNotifier {
  final _sharedPrefKey = 'car';
  final _analytics = FirebaseAnalytics.instance;

  Future<void> getCarFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final carName = prefs.getString(_sharedPrefKey);
    if (carName != null) {
      final car = _cars.firstWhere((element) {
        return element.name == carName;
      });
      await setCurrentCar(car);
    }
  }

  final _cars = [
    Car(
      category: Group.gt3,
      name: "AMR Vantage",
      ecuMaps: [
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
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt3,
      name: "Audi R8 LMS",
      ecuMaps: [
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
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt3,
      name: "Bentley Continental",
      ecuMaps: [
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
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt3,
      name: "BMW M6",
      ecuMaps: [
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
      wheelRotation: 565,
    ),
    Car(
      category: Group.gt3,
      name: "BMW M4",
      ecuMaps: [
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
      wheelRotation: 516,
    ),
    Car(
      category: Group.gt3,
      name: "Emil Frey Jaguar G3",
      ecuMaps: [
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
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt3,
      name: "Ferrari 296",
      ecuMaps: [
        EcuMapGroup(
          name: 'Dry',
          color: AppColors.dryMap,
          maps: [
            EcuMap(1, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(2, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(3, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(4, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(5, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(6, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(7, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(8, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(9, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
            EcuMap(10, 'Power & fuel consumption unchanged\nThrottle map linearity is still WIP'),
          ],
        ),
      ],
      wheelRotation: 800,
    ),
    Car(
      category: Group.gt3,
      name: "Ferrari 488",
      ecuMaps: [
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
      wheelRotation: 480,
    ),
    Car(
      category: Group.gt3,
      name: "Ferrari 488 EVO",
      ecuMaps: [
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
      wheelRotation: 480,
    ),
    Car(
      category: Group.gt3,
      name: "Honda NSX",
      ecuMaps: [
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
      wheelRotation: 620,
    ),
    Car(
      category: Group.gt3,
      name: "Lamborghini Huracan",
      ecuMaps: [
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
      wheelRotation: 620,
    ),
    Car(
      category: Group.gt3,
      name: "Lexus RC F",
      ecuMaps: [
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
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt3,
      name: "McLaren 650S",
      ecuMaps: [
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
      wheelRotation: 480,
    ),
    Car(
      category: Group.gt3,
      name: "McLaren 720S",
      ecuMaps: [
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
      wheelRotation: 480,
    ),
    Car(
      category: Group.gt3,
      name: "Mercedes-AMG",
      ecuMaps: [
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
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt3,
      name: "Nissan GT-R Nismo",
      ecuMaps: [
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
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt3,
      name: "Porsche 991/2",
      ecuMaps: [
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
      wheelRotation: 800,
    ),
    Car(
      category: Group.gt3,
      name: "Reiter Engineering RE-X",
      ecuMaps: [
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
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt4,
      name: "Alpine A110",
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt4,
      name: "AMR V8 Vantage",
      wheelRotation: 640,
    ),
    Car(
      category: Group.gt4,
      name: "Audi R8 LMS",
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt4,
      name: "BMW M4",
      wheelRotation: 500,
    ),
    Car(
      category: Group.gt4,
      name: "Chevrolet Camaro",
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt4,
      name: "Ginetta G55",
      wheelRotation: 720,
    ),
    Car(
      category: Group.gt4,
      name: "KTM X-Bow",
      wheelRotation: 580,
    ),
    Car(
      category: Group.gt4,
      name: "Maserati GranTurismo MC",
      wheelRotation: 900,
    ),
    Car(
      category: Group.gt4,
      name: "McLaren 570S",
      wheelRotation: 480,
    ),
    Car(
      category: Group.gt4,
      name: "Mercedes-AMG",
      wheelRotation: 500,
    ),
    Car(
      category: Group.gt4,
      name: "Porsche 718 Cayman Clubsport",
      wheelRotation: 800,
    ),
    Car(
      category: Group.gtc,
      name: "Porsche 991",
      wheelRotation: 800,
    ),
    Car(
      category: Group.gtc,
      name: "Porsche 992",
      wheelRotation: 540,
    ),
    Car(
      category: Group.gtc,
      name: "Lamborghini Huracan ST",
      wheelRotation: 620,
    ),
    Car(
      category: Group.gtc,
      name: "Ferrari 488 Challenge Evo",
      wheelRotation: 480,
    ),
    Car(
      category: Group.tcx,
      name: "BMW M2 CS Racing",
      wheelRotation: 360,
    ),
  ];

  Car? _currentCar;

  List<Car> get cars {
    return _cars;
  }

  Car? get currentCar {
    return _currentCar;
  }

  Future<void> setCurrentCar(Car newCar) async {
    _currentCar = newCar;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPrefKey, newCar.name);

    _analytics.logEvent(
      name: "select_car",
      parameters: {"car": newCar.name},
    );
  }
}
