import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';

import '../../../../core/error/failures.dart';
import '../entities/workout.dart';

abstract class WorkoutRepositoryType {
  Future<Either<Failure, Workout>> generateWorkout({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
  });

  Future<Either<Failure, Workout>> getWorkout();
}
