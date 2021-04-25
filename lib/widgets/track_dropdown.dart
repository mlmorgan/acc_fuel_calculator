import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flag/flag.dart';

import '../providers/tracks.dart';
import '../models/track/track.dart';

class TrackDropdown extends StatelessWidget {
  final FocusNode nextFocusNode;

  const TrackDropdown({Key? key, required this.nextFocusNode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Tracks>(
      builder: (ctx, tracks, _) => DropdownSearch<Track>(
          label: 'Track',
          mode: Mode.BOTTOM_SHEET,
          showSearchBox: true,
          searchDelay: Duration(milliseconds: 0),
          dropdownBuilderSupportsNullItem: true,
          items: tracks.tracks,
          autoFocusSearchBox: true,
          dropdownBuilder: (context, Track? track, designation) {
            return track != null
                ? TrackDropdownMenuItem(
                    track: track,
                  )
                : SizedBox();
          },
          popupItemBuilder: (context, Track? track, isSelected) {
            return track != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TrackDropdownMenuItem(
                      track: track,
                    ),
                  )
                : SizedBox();
          },
          itemAsString: (Track? track) {
            if (track != null) return track.name;
            return '';
          },
          onChanged: (Track? newTrack) {
            if (newTrack != null) {
              tracks.setCurrentTrack(newTrack);
            }
            FocusScope.of(context).requestFocus(nextFocusNode);
          }),
    );
  }
}

class TrackDropdownMenuItem extends StatelessWidget {
  final Track track;
  const TrackDropdownMenuItem({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Expanded(
            child: Text(track.name),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: Flag(
              track.country.value,
              height: 20,
              width: 30,
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(),
              ],
            ),
          ),
          SizedBox(
            width: 2,
          ),
        ],
      ),
      value: track,
    );
  }
}
