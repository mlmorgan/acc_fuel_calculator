import 'package:flutter/material.dart';

class WheelRotation extends StatelessWidget {
  final int wheelRotation;

  const WheelRotation({Key? key, required this.wheelRotation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wheel rotation',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '${wheelRotation.toString()}°',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
