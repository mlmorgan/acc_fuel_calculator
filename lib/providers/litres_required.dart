import '../models/car/group.dart';
import '../models/track/track.dart';

class LitresRequired {
  final Group category;
  final Track? track;
  final int? raceLength;
  final double? litresPerLap;

  LitresRequired({
    required this.category,
    required this.track,
    required this.raceLength,
    required this.litresPerLap,
  });

  int? get estimatedLaps {
    if ((track != null) && (raceLength != null) && (litresPerLap != null)) {
      final raceLengthMilliseconds =
          Duration(minutes: raceLength!).inMilliseconds;
      final lapTimeMilliseconds = track!.records[category]!.inMilliseconds;
      final safeLapTimeMilliseconds = lapTimeMilliseconds;

      return (raceLengthMilliseconds / safeLapTimeMilliseconds).ceil();
    }
    return null;
  }

  // int get litresRequired {
  //   if ((track != null) && (raceLength != null) && (litresPerLap != null)) {
  //     final raceLengthMilliseconds =
  //         Duration(minutes: raceLength!).inMilliseconds;
  //     final lapTimeMilliseconds = track!.records[category]!.inMilliseconds;
  //     final safeLapTimeMilliseconds = lapTimeMilliseconds;

  //     final litresRequired =
  //         ((raceLengthMilliseconds / safeLapTimeMilliseconds) + 3) *
  //             litresPerLap!;

  //     return litresRequired.ceil();
  //   }
  //   return 0;
  // }

  int get recommended {
    if (estimatedLaps != null) {
      return ((estimatedLaps! + 1) * litresPerLap!).ceil();
    }
    return 0;
  }

  int get safe {
    if (estimatedLaps != null) {
      return ((estimatedLaps! + 2) * litresPerLap!).ceil();
    }
    return 0;
  }

  int get minimum {
    if (estimatedLaps != null) {
      return ((estimatedLaps!) * litresPerLap!).ceil();
    }
    return 0;
  }
}
