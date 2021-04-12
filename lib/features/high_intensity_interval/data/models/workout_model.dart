import 'package:flutter/material.dart';

import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../models/equipment_model.dart' as equipmentModel;
import '../models/tag_model.dart' as tagsModel;
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
    @required List<Exercise> potentialExercises,
    @required Duration totalDuration,
    @required String workoutName,
  }) : super(
          tags: tags,
          equipment: equipment,
          exerciseDuration: exerciseDuration,
          restDuration: restDuration,
          numOfRounds: numOfRounds,
          numOfExercises: numOfExercises,
          exercises: exercises,
          potentialExercises: potentialExercises,
          totalDuration: totalDuration,
          workoutName: workoutName,
        );

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      tags: tagsModel.fromList(json['tags']),
      equipment: equipmentModel.fromList(json['equipment']),
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
      potentialExercises: ExercisesModel.fromList(json['exercises']),
      totalDuration: Duration(
        minutes: json['totalDuration']['minutes'],
        seconds: json['totalDuration']['seconds'],
      ),
      workoutName: json['workoutName'],
    );
  }

  Map<String, dynamic> toJson(String userId) {
    return {
      'tags': tagsModel.toList(tags),
      'equipment': equipmentModel.toList(equipment),
      'exerciseDuration': {
        'minutes': exerciseDuration.inMinutes,
        "seconds": exerciseDuration.inSeconds % 60
      },
      "restDuration": {
        "minutes": restDuration.inMinutes,
        "seconds": restDuration.inSeconds % 60
      },
      "totalDuration": {
        "minutes": totalDuration.inMinutes % 60,
        "seconds": totalDuration.inSeconds % 60
      },
      "numOfRounds": numOfRounds,
      "numOfExercises": numOfExercises,
      "exercises": ExercisesModel.toList(exercises),
      "userId": userId,
      "workoutName": workoutName,
    };
  }
}
