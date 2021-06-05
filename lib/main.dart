import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/category.dart';
import 'providers/ecu_profiles.dart';
import 'providers/litres_per_lap.dart';
import 'providers/litres_required.dart';
import 'providers/race_length.dart';
import 'providers/tracks.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: EcuProfiles(),
        ),
        ChangeNotifierProvider.value(
          value: Tracks(),
        ),
        ChangeNotifierProvider.value(
          value: RaceLength(),
        ),
        ChangeNotifierProvider.value(
          value: LitresPerLap(),
        ),
        ChangeNotifierProvider.value(
          value: Category(),
        ),
        // ChangeNotifierProvider.value(
        //   value: LitresRequired(),
        // ),
        ProxyProvider4<Category, Tracks, RaceLength, LitresPerLap,
            LitresRequired>(
          update:
              (context, category, tracks, raceLength, litresPerLap, previous) {
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
  }
}
