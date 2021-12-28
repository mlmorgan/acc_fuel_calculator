import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';
import '../widgets/litres_per_lap_field.dart';
import '../widgets/litres_required_widget.dart';
import '../widgets/stint_length_field.dart';
import '../widgets/track_dropdown.dart';

class FuelCalculatorScreen extends StatefulWidget {
  static const screenName = "fuel_calculator";
  
  @override
  _FuelCalculatorScreenState createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen>
    with AutomaticKeepAliveClientMixin {
  final stintLengthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CategorySelector(),
            SizedBox(height: 16),
            TrackDropdown(
              nextFocusNode: stintLengthFocusNode,
            ),
            // SizedBox(
            //   height: 16,
            // ),
            // CarDropdown(),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: StintLengthField(
                  focusNode: stintLengthFocusNode,
                )),
                SizedBox(width: 8),
                Expanded(child: LitresPerLapField()),
              ],
            ),
            // SizedBox(height: 16),
            SizedBox(height: 32),
            LitresRequiredWidget(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
