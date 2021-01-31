import 'package:flutter/material.dart';

import '../../../../enums/equipment.dart';
import '../../../../enums/tags.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';

class WorkoutModel extends Workout {
  WorkoutModel({
    @required List<Tags> tags,
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
}
