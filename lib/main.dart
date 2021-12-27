import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'providers/category.dart';
import 'providers/ecu_profiles.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final category = Category();
  final tracks = Tracks();
  final raceLength = RaceLength();
  final litresPerLap = LitresPerLap();
  final ecuProfiles = EcuProfiles();

  Future<void> getAllDataFromPersistence() async {
    final futures = [
      category.getCategoryFromPersistence(),
      tracks.getTrackFromPersistence(),
      raceLength.getRacelengthFromPersistence(),
      litresPerLap.getLitresPerLapFromPersistence(),
      ecuProfiles.getEcuProfileFromPersistence(),      
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
                value: ecuProfiles,
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
          return MaterialApp();
        }
      },
    );
  }
}
