import 'package:flutter/material.dart';

class EcuProfile {
  final String name;
  final List<EcuMapGroup> groups;

  EcuProfile({
    required this.name,
    required this.groups,
  });
}

class EcuMapGroup {
  final String name;
  final Color color;
  final List<EcuMap> maps;

  EcuMapGroup({
    required this.name,
    required this.color,
    required this.maps,
  });
}

class EcuMap {
  final int number;
  final String description;

  EcuMap(this.number, this.description);
}
