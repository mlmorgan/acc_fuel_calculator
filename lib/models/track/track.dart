import 'package:firebase_analytics/firebase_analytics.dart';

import '../car/group.dart';
import 'country.dart';

class Track extends AnalyticsEventItem {
  final String name;
  final Country country;
  final Map<Group, Duration> records;

  Track({
    required this.name,
    required this.country,
    required this.records,
  });
}
