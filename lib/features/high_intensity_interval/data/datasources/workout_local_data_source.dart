import 'package:flutter/material.dart';

import '../../../../exercise_data.dart';
import '../../domain/entities/exercise.dart';
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
    @required String workoutName,
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
    @required String workoutName,
  }) async {
    var listOfAllExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    List<Exercise> potentialExercises = [];
    listOfAllExercises.forEach((element) {
      if (element.tags.every((item) => tags.contains(item)) &&
          equipment.contains(element.equipment)) {
        potentialExercises.add(element);
      }
    });
    var exercises;
    // if there are enough exercises in pool
    if (potentialExercises.length >= numberOfExercises) {
      potentialExercises.shuffle();
      exercises = List.generate(
          numberOfExercises, (index) => potentialExercises.elementAt(index));
    } else
      throw UnimplementedError();
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
      potentialExercises: potentialExercises,
      workoutName: workoutName,
    );
  }
}
