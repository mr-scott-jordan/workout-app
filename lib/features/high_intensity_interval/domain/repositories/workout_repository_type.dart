import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../entities/workout.dart';
import '../enums/equipment.dart';
import '../enums/tag.dart';

abstract class WorkoutRepositoryType {
  Future<Either<Failure, Workout>> generateWorkout({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
    @required Duration exerciseDuration,
    @required Duration restDuration,
    @required int numberOfRounds,
  });

  Future<Either<Failure, Workout>> getWorkout(String userId);
}
