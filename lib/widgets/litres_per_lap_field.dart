import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/litres_per_lap.dart';
import '../util/decimal_input_formatter.dart';

class LitresPerLapField extends StatelessWidget {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final initialValue = context.read<LitresPerLap>().litresPerLap;
    if (initialValue != null) {
      _textFieldController.text = initialValue.toString();
    }

    return Consumer<LitresPerLap>(
      builder: (ctx, litresPerLap, _) {
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  labelText: 'Litres per lap'),
              controller: _textFieldController,
              inputFormatters: [DecimalInputFormatter()],
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onChanged: (newValue) {
                litresPerLap.setLitresPerLap(double.tryParse(newValue) ?? 0);
              },
            ),
          ],
        );
      },
    );
  }
}
