import 'package:flutter/material.dart';

import 'ecu_map.dart';

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
