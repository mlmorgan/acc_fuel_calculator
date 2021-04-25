import '../car/group.dart';
import 'country.dart';

class Track {
  final String name;
  final Country country;
  final Map<Group, Duration> records;

  const Track({
    required this.name,
    required this.country,
    required this.records,
  });
}
