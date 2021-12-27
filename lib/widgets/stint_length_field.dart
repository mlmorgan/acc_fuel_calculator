import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/race_length.dart';

class StintLengthField extends StatelessWidget {
  final FocusNode focusNode;
  final _textFieldController = TextEditingController();

  StintLengthField({Key? key, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialValue = context.read<RaceLength>().raceLength;
    if (initialValue != null) {
      _textFieldController.text = initialValue.toString();
    }

    return Consumer<RaceLength>(
      builder: (ctx, raceLength, _) {
        return Column(
          children: [
            TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  labelText: 'Stint minutes'),
              controller: _textFieldController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              onChanged: (newValue) {
                raceLength.setRaceLength(int.tryParse(newValue) ?? 0);
              },
              textInputAction: TextInputAction.next,
            ),
          ],
        );
      },
    );
  }
}
