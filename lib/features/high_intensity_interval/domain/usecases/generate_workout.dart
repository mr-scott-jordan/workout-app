import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/workout.dart';
import '../enums/equipment.dart';
import '../enums/tag.dart';
import '../repositories/workout_repository.dart';

class GenerateWorkout implements UseCase<Workout, GenerateWorkoutParams> {
  final WorkoutRepository repository;

  GenerateWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(GenerateWorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
    );
  }
}

class GenerateWorkoutParams extends Params {
  final int numberOfExercises;
  final List<Tag> tags;
  final List<Equipment> equipment;

  GenerateWorkoutParams({
    @required this.numberOfExercises,
    @required this.tags,
    @required this.equipment,
  });

  @override
  List<Object> get props => [
        numberOfExercises,
        tags,
        equipment,
      ];
}
