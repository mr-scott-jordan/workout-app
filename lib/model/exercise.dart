import 'package:flutter/material.dart';

import '../enums/equipment.dart';

class Exercise {
  final String id;
  final String label;
  final List<String> tags;
  final Equipment equipment;

  Exercise({
    @required this.id,
    @required this.label,
    @required this.tags,
    @required this.equipment,
  }) : assert(id != null && label != null && tags != null && equipment != null);
}
