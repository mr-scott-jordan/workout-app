import 'package:flutter/material.dart';

import '../../../../exercise_data.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../models/workout_model.dart';

abstract class WorkoutLocalDataSourceType {
  /// Generates a workout model based on the received parameters
  Future<WorkoutModel> generateWorkout({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
    @required Duration exerciseDuration,
    @required Duration restDuration,
    @required int numberOfRounds,
  });
}

class WorkoutLocalDataSource implements WorkoutLocalDataSourceType {
  WorkoutLocalDataSource();

  @override
  Future<WorkoutModel> generateWorkout({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
    @required Duration exerciseDuration,
    @required Duration restDuration,
    @required int numberOfRounds,
  }) async {
    var listOfAllExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    listOfAllExercises.shuffle();
    var exercises = List.generate(
        numberOfExercises, (index) => listOfAllExercises.elementAt(index));
    var totalDuration =
        (exerciseDuration + restDuration) * numberOfExercises * numberOfRounds;

    return WorkoutModel(
      equipment: equipment,
      exerciseDuration: exerciseDuration,
      exercises: exercises,
      numOfExercises: numberOfExercises,
      numOfRounds: numberOfRounds,
      restDuration: restDuration,
      tags: tags,
      totalDuration: totalDuration,
    );
  }
}
