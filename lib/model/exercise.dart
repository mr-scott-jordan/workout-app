import 'package:flutter/material.dart';

import '../enums/equipment.dart';

class Exercise {
  final String id;
  final String title;
  final List<String> tags;
  final Equipment equipment;

  const Exercise({
    @required this.id,
    @required this.title,
    @required this.tags,
    @required this.equipment,
  }) : assert(id != null && title != null && tags != null && equipment != null);
}
