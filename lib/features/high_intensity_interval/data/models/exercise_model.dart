import 'package:flutter/material.dart';

import '../../domain/entities/exercise.dart';
import '../models/equipment_model.dart' as equipmentModel;
import '../models/tag_model.dart' as tagsModel;

class ExerciseModel extends Exercise {
  ExerciseModel({
    @required id,
    @required title,
    @required tags,
    @required equipment,
    @required asset,
  }) : super(
          equipment: equipment,
          id: id,
          title: title,
          tags: tags,
          asset: asset,
        );

  factory ExerciseModel.fromJson(dynamic json) {
    return ExerciseModel(
      id: json['id'],
      title: json['title'],
      tags: tagsModel.fromList(json['tags']),
      equipment: equipmentModel.fromString(json['equipment']),
      asset: json['asset'],
    );
  }

  static Map<String, dynamic> toJson(Exercise exercise) {
    return {
      'id': exercise.id,
      'title': exercise.title,
      'tags': tagsModel.toList(exercise.tags),
      'equipment': equipmentModel.toString(exercise.equipment),
      'asset': exercise.asset,
    };
  }
}
