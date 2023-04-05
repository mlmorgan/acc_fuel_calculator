import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return kReleaseMode
          ? "ca-app-pub-7640075979045354/7339536957"
          : 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return kReleaseMode
          ? "ca-app-pub-7640075979045354/7534978078"
          : 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
