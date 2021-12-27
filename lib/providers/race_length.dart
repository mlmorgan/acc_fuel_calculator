import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaceLength with ChangeNotifier {
  int? _raceLength;
  final sharedPrefKey = 'raceLength';

  Future<void> getRacelengthFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final raceLength = prefs.getInt(sharedPrefKey);
    if (raceLength != null) {
      await setRaceLength(raceLength);
    }
  }

  int? get raceLength {
    return _raceLength;
  }

  Future<void> setRaceLength(int newRaceLength) async {
    _raceLength = newRaceLength;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(sharedPrefKey, newRaceLength);
  }
}
