import 'package:flutter/material.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import '../models/equipment_model.dart' as equipment;
import '../models/tag_model.dart' as tags;

class ExerciseModel extends Exercise {
  ExerciseModel({
    @required id,
    @required title,
    @required tags,
    @required equipment,
  }) : super(
          equipment: equipment,
          id: id,
          title: title,
          tags: tags,
        );
}

ExerciseModel fromJson(Map<String, dynamic> json) {
  return ExerciseModel(
    id: json['id'],
    title: json['title'],
    tags: tags.fromList(json['tags']),
    equipment: equipment.fromString(json['equipment']),
  );
}
