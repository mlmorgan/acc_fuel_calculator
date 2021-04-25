import 'brand.dart';
import 'group.dart';

class Car {
  final Group category;
  final Brand brand;
  final String name;
  final int year;

  const Car({
    required this.category,
    required this.brand,
    required this.name,
    required this.year,
  });
}
