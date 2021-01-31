import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../enums/equipment.dart';
import '../../../../enums/tags.dart';
import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

// This actually does not need to reach out to the data layer.
// Exercises are generated logically on device and therefore
// that business logic will reside here.
class GenerateWorkout implements UseCase<Workout, WorkoutParams> {
  final WorkoutRepository repository;

  GenerateWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(WorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
    );
  }
}

// This UseCase will reach out across the network and generate a workout.
// Therefore, this UseCase will interact with the data layer via the Repository.
class GetWorkout implements UseCase<Workout, WorkoutParams> {
  final WorkoutRepository repository;

  GetWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(WorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
    );
  }
}

class WorkoutParams extends Equatable {
  final int numberOfExercises;
  final List<Tags> tags;
  final List<Equipment> equipment;

  WorkoutParams({
    @required this.numberOfExercises,
    @required this.tags,
    @required this.equipment,
  });

  List<Object> get props => [
        numberOfExercises,
        tags,
        equipment,
      ];
}
