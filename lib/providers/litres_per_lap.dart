import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LitresPerLap with ChangeNotifier {
  
  double? _litresPerLap;
  final sharedPrefKey = 'litresPerLap';

  Future<void> getLitresPerLapFromPersistence() async {
    final prefs = await SharedPreferences.getInstance();
    final litresPerLap = prefs.getDouble(sharedPrefKey);
    if (litresPerLap != null) {
      await setLitresPerLap(litresPerLap);
    }
  }

  double? get litresPerLap {
    return _litresPerLap;
  }

  Future<void> setLitresPerLap(double newLitresPerLap) async {
    _litresPerLap = newLitresPerLap;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(sharedPrefKey, newLitresPerLap);
  }
}
