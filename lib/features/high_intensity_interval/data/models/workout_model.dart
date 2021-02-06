import 'package:flutter/material.dart';

import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../models/equipment_model.dart' as equipment;
import '../models/tag_model.dart' as tags;
import 'exercises_model.dart';

class WorkoutModel extends Workout {
  WorkoutModel({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required Duration exerciseDuration,
    @required Duration restDuration,
    @required int numOfRounds,
    @required int numOfExercises,
    @required List<Exercise> exercises,
    @required Duration totalDuration,
  }) : super(
          tags: tags,
          equipment: equipment,
          exerciseDuration: exerciseDuration,
          restDuration: restDuration,
          numOfRounds: numOfRounds,
          numOfExercises: numOfExercises,
          exercises: exercises,
          totalDuration: totalDuration,
        );

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      tags: tags.fromList(json['tags']),
      equipment: equipment.fromList(json['equipment']),
      exerciseDuration: Duration(
        minutes: json['exerciseDuration']['minutes'],
        seconds: json['exerciseDuration']['seconds'],
      ),
      restDuration: Duration(
        minutes: json['restDuration']['minutes'],
        seconds: json['restDuration']['seconds'],
      ),
      numOfRounds: json['numOfRounds'],
      numOfExercises: json['numOfExercises'],
      exercises: ExercisesModel.fromList(json['exercises']),
      totalDuration: Duration(
        minutes: json['totalDuration']['minutes'],
        seconds: json['totalDuration']['seconds'],
      ),
    );
  }
}
