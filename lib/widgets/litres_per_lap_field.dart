import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/litres_per_lap.dart';

class LitresPerLapField extends StatelessWidget {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LitresPerLap>(
      builder: (ctx, litresPerLap, _) {
        // if (litresPerLap.litresPerLap == 0) {
        //   _textFieldController.text = '';
        // } else {
        //   _textFieldController.text = litresPerLap.litresPerLap.toString();
        // }
        //

        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  labelText: 'Litres per lap'),
              controller: _textFieldController,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onChanged: (newValue) {
                litresPerLap.setLitresPerLap(double.tryParse(newValue) ?? 0);
              },
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           litresPerLap
            //               .setLitresPerLap(litresPerLap.litresPerLap + 1);
            //         },
            //         child: Text("+ 1"),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           litresPerLap
            //               .setLitresPerLap(litresPerLap.litresPerLap + 0.1);
            //         },
            //         child: Text("+ 0.1"),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           litresPerLap
            //               .setLitresPerLap(litresPerLap.litresPerLap + 0.01);
            //         },
            //         child: Text("+ 0.01"),
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
