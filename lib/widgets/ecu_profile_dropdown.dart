import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ecu_profile/ecu_profile.dart';
import '../providers/ecu_profiles.dart';

class EcuProfileDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Consumer<EcuProfiles>(
      builder: (ctx, ecuProfiles, _) => DropdownSearch<EcuProfile>(
        selectedItem: ecuProfiles.currentEcuProfile,
        label: 'Car',
        mode: useMobileLayout ? Mode.BOTTOM_SHEET : Mode.DIALOG,
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 0),
        dropdownBuilderSupportsNullItem: true,
        items: ecuProfiles.ecuProfiles,
        autoFocusSearchBox: true,
        dropdownBuilder: (context, EcuProfile? ecuProfile, designation) {
          return ecuProfile != null
              ? EcuProfileDropdownMenuItem(
                  ecuProfile: ecuProfile,
                )
              : SizedBox();
        },
        popupItemBuilder: (context, EcuProfile? ecuProfile, isSelected) {
          return ecuProfile != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: EcuProfileDropdownMenuItem(
                    ecuProfile: ecuProfile,
                  ),
                )
              : SizedBox();
        },
        itemAsString: (EcuProfile? ecuProfile) {
          if (ecuProfile != null) return ecuProfile.name;
          return '';
        },
        onChanged: (EcuProfile? newEcuProfile) {
          if (newEcuProfile != null) {
            ecuProfiles.setCurrentEcuProfile(newEcuProfile);
          }
        },
      ),
    );
  }
}

class EcuProfileDropdownMenuItem extends StatelessWidget {
  final EcuProfile ecuProfile;
  const EcuProfileDropdownMenuItem({
    Key? key,
    required this.ecuProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Expanded(
            child: Text(ecuProfile.name),
          ),
        ],
      ),
      value: ecuProfile,
    );
  }
}
