import 'package:flutter/foundation.dart';

class LitresPerLap with ChangeNotifier {
  double? _litresPerLap;

  double? get litresPerLap {
    return _litresPerLap;
  }

  void setLitresPerLap(double newLitresPerLap) {
    _litresPerLap = newLitresPerLap;
    notifyListeners();
  }
}
