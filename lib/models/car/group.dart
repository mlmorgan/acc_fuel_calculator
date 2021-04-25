import '../../util/enum.dart';

class Group extends Enum<String> {
  const Group(String val) : super(val);
  
  static const Group gt3 = const Group("GT3");
  static const Group gt4 = const Group("GT4");
  static const Group st = const Group("Super Trofeo");
  static const Group cup = const Group("Porsche Cup");
}
