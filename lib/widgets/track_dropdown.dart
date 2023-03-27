import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/track/track.dart';
import '../providers/tracks.dart';

class TrackDropdown extends StatelessWidget {
  final FocusNode nextFocusNode;

  const TrackDropdown({Key? key, required this.nextFocusNode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final useMobileLayout = shortestSide < 600;
    final showSearchBox = true;
    final searchDelay = Duration(milliseconds: 0);
    final searchFieldProps = TextFieldProps(autofocus: true);

    return Consumer<Tracks>(
      builder: (ctx, tracks, _) => DropdownSearch<Track>(
        selectedItem: tracks.currentTrack,
        items: tracks.tracks,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: 'Track',
            contentPadding: const EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              left: 12.0,
              right: 0.0,
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        popupProps: useMobileLayout
            ? PopupProps.menu(
                showSearchBox: showSearchBox,
                searchDelay: searchDelay,
                searchFieldProps: searchFieldProps,
                itemBuilder: _popUpItemBuilder)
            : PopupProps.dialog(
                showSearchBox: showSearchBox,
                searchDelay: searchDelay,
                searchFieldProps: searchFieldProps,
                itemBuilder: _popUpItemBuilder,
              ),
        dropdownBuilder: (context, Track? track) {
          return track != null
              ? TrackDropdownMenuItem(
                  track: track,
                )
              : SizedBox();
        },
        itemAsString: (Track? track) {
          return (track != null) ? track.name : '';
        },
        onChanged: (Track? newTrack) {
          if (newTrack != null) {
            tracks.setCurrentTrack(newTrack);
          }
          if (!kIsWeb) FocusScope.of(context).requestFocus(nextFocusNode);
        },
      ),
    );
  }

  Widget _popUpItemBuilder(
    BuildContext context,
    Track? track,
    bool isSelected,
  ) {
    return track != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TrackDropdownMenuItem(
              track: track,
            ),
          )
        : SizedBox();
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
              'images/flags/svg/${track.country.value}.svg',
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
