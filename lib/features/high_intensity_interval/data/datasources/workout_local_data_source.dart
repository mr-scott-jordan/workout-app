import 'package:flutter/material.dart';

import '../../../../services/get_potential_exercises_service.dart';
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
    List<Exercise> potentialExercises =
        GetPotentialExercisesService.getExercises(
      tags: tags,
      equipment: equipment,
    );
    var exercises = List.generate(
        numberOfExercises, (index) => potentialExercises.elementAt(index));

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
