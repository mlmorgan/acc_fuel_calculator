import '../../util/enum.dart';

class Country extends Enum<String> {
  const Country(String val) : super(val);

  static const Country australia = const Country("au");
  static const Country belgium = const Country("be");
  static const Country france = const Country("fr");
  static const Country germany = const Country("de");
  static const Country hungary = const Country("hu");
  static const Country italy = const Country("it");
  static const Country japan = const Country("jp");
  static const Country netherlands = const Country("nl");
  static const Country southAfrica = const Country("za");
  static const Country spain = const Country("es");
  static const Country unitedKingdom = const Country("gb");
  static const Country usa = const Country("us");
}
