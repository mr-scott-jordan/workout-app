import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/enums/equipment.dart';

class Exercise extends Equatable {
  final String id;
  final String title;
  final List<String> tags;
  final Equipment equipment;

  Exercise({
    @required this.id,
    @required this.title,
    @required this.tags,
    @required this.equipment,
  }) : assert(id != null && title != null && tags != null && equipment != null);

  @override
  List<Object> get props => [
        id,
        title,
        tags,
        equipment,
      ];
}
