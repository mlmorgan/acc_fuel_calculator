// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

// import '../models/ecu_profile/ecu_profile.dart';
// import '../util/constants.dart';

// class EcuProfiles with ChangeNotifier {
//   final _sharedPrefKey = 'ecuProfile';
//   final _analytics = FirebaseAnalytics.instance;

//   Future<void> getEcuProfileFromPersistence() async {
//     final prefs = await SharedPreferences.getInstance();
//     final ecuProfileName = prefs.getString(_sharedPrefKey);
//     if (ecuProfileName != null) {
//       final ecuProfile = _ecuProfiles.firstWhere((element) {
//         return element.name == ecuProfileName;
//       });
//       await setCurrentEcuProfile(ecuProfile);
//     }
//   }

//   final _ecuProfiles = [
//     EcuProfile(
//       name: 'Aston Martin Vantage V8/V12',
//       groups: [
//         EcuMapGroup(
//           name: 'Dry',
//           color: AppColors.dryMap,
//           maps: [
//             EcuMap(1, 'Fastest\nHigh fuel consumption'),
//             EcuMap(2,
//                 'A bit slower\nNormal fuel consumption\nAggressive throttle map'),
//             EcuMap(3,
//                 'A bit slower\nNormal fuel consumption\nProgressive throttle map'),
//             EcuMap(
//                 4, 'Slowest\nLess fuel consumption\nProgressive throttle map'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Wet',
//           color: AppColors.wetMap,
//           maps: [
//             EcuMap(5,
//                 'Similar to dry 2 & 3\nNormal fuel consumption\nSlightly progressive throttle map'),
//             EcuMap(6,
//                 'A bit slower\nLess fuel consumption\nProgressive wet throttle map'),
//             EcuMap(7, 'Identical to 6\nMore progressive throttle map'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Pace Car',
//           color: AppColors.paceCarMap,
//           maps: [
//             EcuMap(8, 'Very slow\nLow consumption'),
//           ],
//         ),
//       ],
//     ),
//     EcuProfile(
//       name: 'Audi R8',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Bentley Continental',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'BMW M4/M6',
//       groups: [
//         EcuMapGroup(
//           name: 'Dry',
//           color: AppColors.dryMap,
//           maps: [
//             EcuMap(1,
//                 'Fastest\nVery high fuel consumption\nAggressive throttle map'),
//             EcuMap(2,
//                 'A bit slower\nNormal fuel consumption\nLinear throttle map'),
//             EcuMap(3, 'Identical to 2\nGradual throttle map'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Reserved',
//           color: AppColors.paceCarMap,
//           maps: [
//             EcuMap(4, 'Do not use\nVery low power'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Pace Car',
//           color: AppColors.paceCarMap,
//           maps: [
//             EcuMap(5, 'Low power\nLow fuel consumption'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Wet',
//           color: AppColors.wetMap,
//           maps: [
//             EcuMap(6, 'Fastest\nHigh fuel consumption\nWet throttle map'),
//             EcuMap(
//                 7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
//             EcuMap(8, 'Identical to 7\nDifferent wet throttle map'),
//           ],
//         ),
//       ],
//     ),
//     EcuProfile(
//       name: 'Ferrari 488',
//       groups: [
//         EcuMapGroup(
//           name: 'Dry',
//           color: AppColors.dryMap,
//           maps: [
//             EcuMap(1, 'Fastest\nNormal fuel consumption'),
//             EcuMap(2, 'A bit slower\nLess fuel consumption'),
//             EcuMap(3, 'A bit slower\nNormal fuel consumption'),
//             EcuMap(4, 'Slowest\nLowest fuel consumption'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Wet',
//           color: AppColors.wetMap,
//           maps: [
//             EcuMap(5, 'Fastest\nNormal fuel consumption\nWet throttle map'),
//             EcuMap(6, 'A bit slower\nLess fuel consumption\nWet throttle map'),
//             EcuMap(
//                 7, 'A bit slower\nNormal fuel consumption\nWet throttle map'),
//             EcuMap(8, 'Slowest\nLowest fuel consumption\nWet throttle map'),
//           ],
//         ),
//         EcuMapGroup(
//           name: 'Pace Car & Reserved',
//           color: AppColors.paceCarMap,
//           maps: [
//             EcuMap(9, 'Very low power\nLow fuel consumption'),
//             EcuMap(10, 'Similar to 9'),
//             EcuMap(11, 'Similar to 9'),
//             EcuMap(12, 'Similar to 9'),
//           ],
//         ),
//       ],
//     ),
//     EcuProfile(
//       name: 'Ferrari 488 EVO',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Honda NSX',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Reiter Engineering R-EX',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Lamborghini Huracan',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Emil Frey Jaguar',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Nissan GT-R',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Lexus RC F',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'McLaren 650S',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'McLaren 720S',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Mercedes AMG',
//       groups: 
//     ),
//     EcuProfile(
//       name: 'Porsche 991',
//       groups: 
//     ),
//   ];

//   EcuProfile? _currentEcuProfile;

//   List<EcuProfile> get ecuProfiles {
//     return _ecuProfiles;
//   }

//   EcuProfile? get currentEcuProfile {
//     return _currentEcuProfile;
//   }

//   Future<void> setCurrentEcuProfile(EcuProfile newEcuProfile) async {
//     _currentEcuProfile = newEcuProfile;
//     notifyListeners();

//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_sharedPrefKey, newEcuProfile.name);

//     _analytics.logEvent(
//       name: "select_ecu_profile",
//       parameters: {"ecu_profile": newEcuProfile.name},
//     );
//   }
// }
