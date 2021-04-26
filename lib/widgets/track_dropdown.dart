import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/tracks.dart';
import '../models/track/track.dart';

class TrackDropdown extends StatelessWidget {
  final FocusNode nextFocusNode;

  const TrackDropdown({Key? key, required this.nextFocusNode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Consumer<Tracks>(
      builder: (ctx, tracks, _) => DropdownSearch<Track>(
        label: 'Track',
        mode: useMobileLayout ? Mode.BOTTOM_SHEET : Mode.DIALOG,
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
        },
      ),
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
            child: SvgPicture.asset(
              'images/flags/${track.country.value}.svg',
              width: 28,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                ),
              ],
              shape: BoxShape.circle,
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
