import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/race_length.dart';

class StintLengthField extends StatelessWidget {
  final FocusNode focusNode;
  final _textFieldController = TextEditingController();

  StintLengthField({Key? key, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RaceLength>(
      builder: (ctx, raceLength, _) {
        // if (raceLength.raceLength == 0) {
        //   _textFieldController.text = '';
        // } else {
        //   _textFieldController.text = raceLength.raceLength.toString();
        // }

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
              // onSubmitted: (value) {
              //   raceLength.setRaceLength(int.parse(value));
              // },
              onChanged: (newValue) {
                raceLength.setRaceLength(int.tryParse(newValue) ?? 0);
              },
              textInputAction: TextInputAction.next,
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           raceLength.setRaceLength(raceLength.raceLength + 10);
            //         },
            //         child: Text("+ 10"),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           raceLength.setRaceLength(raceLength.raceLength + 5);
            //         },
            //         child: Text("+ 5"),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           raceLength.setRaceLength(raceLength.raceLength + 1);
            //         },
            //         child: Text("+ 1"),
            //       ),
            //     ),
            //   ],
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ),
          ],
        );
      },
    );
  }
}
