import 'package:flutter/foundation.dart';

class RaceLength with ChangeNotifier {
  int? _raceLength;

  int? get raceLength {
    return _raceLength;
  }

  void setRaceLength(int newRaceLength) {
    _raceLength = newRaceLength;
    notifyListeners();
  }
}
