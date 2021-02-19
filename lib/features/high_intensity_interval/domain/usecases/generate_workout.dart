import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/workout.dart';
import '../enums/equipment.dart';
import '../enums/tag.dart';
import '../repositories/workout_repository_type.dart';

class GenerateWorkout implements UseCase<Workout, GenerateWorkoutParams> {
  final WorkoutRepositoryType repository;

  GenerateWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(GenerateWorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
      exerciseDuration: params.exerciseDuration,
      restDuration: params.restDuration,
      numberOfRounds: params.numberOfRounds,
    );
  }
}

class GenerateWorkoutParams extends Params {
  final int numberOfExercises;
  final List<Tag> tags;
  final List<Equipment> equipment;
  final Duration exerciseDuration;
  final Duration restDuration;
  final int numberOfRounds;

  GenerateWorkoutParams({
    @required this.numberOfExercises,
    @required this.tags,
    @required this.equipment,
    @required this.exerciseDuration,
    @required this.restDuration,
    @required this.numberOfRounds,
  });

  @override
  List<Object> get props => [
        numberOfExercises,
        tags,
        equipment,
        exerciseDuration,
        restDuration,
        numberOfRounds,
      ];
}
