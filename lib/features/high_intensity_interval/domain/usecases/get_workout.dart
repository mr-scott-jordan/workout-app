import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/workout.dart';
import '../repositories/workout_repository_type.dart';

class GetWorkout implements UseCase<Workout, GetWorkoutParams> {
  final WorkoutRepositoryType repository;

  GetWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(
      GetWorkoutParams getWorkoutParams) async {
    return await repository.getWorkout(getWorkoutParams.userId);
  }
}

class GetWorkoutParams extends Params {
  final String userId;

  GetWorkoutParams({
    @required this.userId,
  });

  @override
  List<Object> get props => [
        userId,
      ];
}
