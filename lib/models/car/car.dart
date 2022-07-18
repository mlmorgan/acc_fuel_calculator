import 'group.dart';
import '../ecu_profile/ecu_profile.dart';

class Car {
  final Group category;
  final String name;
  final EcuProfile ecuProfile;
  final int wheelRotation;

  const Car(
      {required this.category,
      required this.name,
      required this.ecuProfile,
      required this.wheelRotation});
}
