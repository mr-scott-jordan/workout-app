import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:workout_app/core/use_cases/use_case.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';

import 'generate_workout.dart';

class GetWorkout implements UseCase<Workout, WorkoutParams> {
  final WorkoutRepository repository;

  GetWorkout(this.repository);

// This UseCase will reach out across the network and generate a workout.
// Therefore, this UseCase will interact with the data layer via the Repository.
  @override
  Future<Either<Failure, Workout>> call(WorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
    );
  }
}

class WorkoutParams extends Params {
  final int numberOfExercises;
  final List<Tags> tags;
  final List<Equipment> equipment;

  WorkoutParams({
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
