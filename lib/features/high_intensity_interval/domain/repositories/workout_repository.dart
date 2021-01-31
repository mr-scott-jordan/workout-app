import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../enums/equipment.dart';
import '../../../../enums/tags.dart';
import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, Workout>> generateWorkout({
    @required List<Tags> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
  });
}
