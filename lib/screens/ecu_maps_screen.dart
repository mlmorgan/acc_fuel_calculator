import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ecu_profiles.dart';
import '../widgets/ecu_map_group_card.dart';
import '../widgets/ecu_profile_dropdown.dart';

class EcuMapsScreen extends StatefulWidget {
  @override
  _EcuMapsScreenState createState() => _EcuMapsScreenState();
}

class _EcuMapsScreenState extends State<EcuMapsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<EcuProfiles>(
      builder: (context, ecuProfiles, child) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 8),
              child: EcuProfileDropdown(),
            ),
          ),
          ecuProfiles.currentEcuProfile != null
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: EcuMapGroupCard(
                            ecuMapGroup:
                                ecuProfiles.currentEcuProfile!.groups[index]),
                      );
                    },
                    childCount: 3,
                  ),
                )
              : SliverToBoxAdapter(
                  child: Container(),
                ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
