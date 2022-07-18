import 'package:firebase_analytics/firebase_analytics.dart';

import 'group.dart';
import '../ecu_map/ecu_map_group.dart';

class Car extends AnalyticsEventItem {
  final Group category;
  final String name;
  final List<EcuMapGroup>? ecuMaps;
  final int wheelRotation;

  Car({
    required this.category,
    required this.name,
    this.ecuMaps,
    required this.wheelRotation,
  });
}
