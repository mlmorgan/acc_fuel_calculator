import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'providers/category.dart';
import 'providers/cars.dart';
import 'providers/litres_per_lap.dart';
import 'providers/litres_required.dart';
import 'providers/race_length.dart';
import 'providers/tracks.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final analytics = FirebaseAnalytics.instance;
  analytics.logAppOpen();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final category = Category();
  final tracks = Tracks();
  final raceLength = RaceLength();
  final litresPerLap = LitresPerLap();
  final cars = Cars();

  Future<void> getAllDataFromPersistence() async {
    final futures = [
      category.getCategoryFromPersistence(),
      tracks.getTrackFromPersistence(),
      raceLength.getRacelengthFromPersistence(),
      litresPerLap.getLitresPerLapFromPersistence(),
      cars.getCarFromPersistence(),
    ];
    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllDataFromPersistence(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: cars,
              ),
              ChangeNotifierProvider.value(
                value: tracks,
              ),
              ChangeNotifierProvider.value(
                value: raceLength,
              ),
              ChangeNotifierProvider.value(
                value: litresPerLap,
              ),
              ChangeNotifierProvider.value(
                value: category,
              ),
              ProxyProvider4<Category, Tracks, RaceLength, LitresPerLap,
                  LitresRequired>(
                update: (context, category, tracks, raceLength, litresPerLap,
                    previous) {
                  return LitresRequired(
                      category: category.category,
                      track: tracks.currentTrack,
                      raceLength: raceLength.raceLength,
                      litresPerLap: litresPerLap.litresPerLap);
                },
              ),
            ],
            child: MaterialApp(
              navigatorObservers: [],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.teal,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.teal,
              ),
              themeMode: ThemeMode.system,
              home: HomeScreen(),
            ),
          );
        } else {
          return MaterialApp(
            home: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
