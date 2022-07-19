import 'package:flutter/material.dart';

class Group {
  final String name;
  final Color color;

  const Group({
    required this.name,
    required this.color,
  });

  static const Group gt3 = const Group(
    name: 'GT3',
    color: Color.fromARGB(255, 194, 14, 24),
  );
  static const Group gt4 = const Group(
    name: 'GT4',
    color: Color.fromARGB(255, 42, 42, 100),
  );
  static const Group gtc = const Group(
    name: 'GTC',
    color: Color.fromARGB(255, 245, 126, 0),
  );
  static const Group tcx = const Group(
    name: 'TCX',
    color: Color.fromARGB(255, 0, 124, 168),
  );
}
