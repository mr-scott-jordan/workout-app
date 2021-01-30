import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Exercise>>> generateExercises({
    @required List<Tags> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
  });
}
