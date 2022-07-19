import 'package:flutter/material.dart';

import '../models/car/group.dart';

class ClassIndicator extends StatelessWidget {
  final Group group;

  const ClassIndicator({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: group.color,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          group.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
