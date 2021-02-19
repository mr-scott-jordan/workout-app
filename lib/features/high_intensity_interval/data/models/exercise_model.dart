import 'package:flutter/material.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import '../models/equipment_model.dart' as equipmentModel;
import '../models/tag_model.dart' as tagsModel;

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

  factory ExerciseModel.fromJson(dynamic json) {
    return ExerciseModel(
      id: json['id'],
      title: json['title'],
      tags: tagsModel.fromList(json['tags']),
      equipment: equipmentModel.fromString(json['equipment']),
    );
  }

  static Map<String, dynamic> toJson(Exercise exercise) {
    return {
      'id': exercise.id,
      'title': exercise.title,
      'tags': tagsModel.toList(exercise.tags),
      'equipment': equipmentModel.toString(exercise.equipment),
    };
  }
}
