import 'package:flutter/material.dart';

class WheelRotation extends StatelessWidget {
  final int wheelRotation;

  const WheelRotation({Key? key, required this.wheelRotation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${wheelRotation.toString()}°',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
