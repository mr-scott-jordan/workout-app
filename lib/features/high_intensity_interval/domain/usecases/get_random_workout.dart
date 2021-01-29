import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:workout_app/core/usecase/usecase.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';

class GetRandomWorkout implements UseCase<List<Exercise>, WorkoutParams> {
  final WorkoutRepository repository;

  GetRandomWorkout(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call(WorkoutParams params) async {
    return await repository.getRandomExercises(params.workout);
  }
}

class WorkoutParams extends Equatable {
  final Workout workout;

  WorkoutParams({@required this.workout});

  List<Object> get props => [workout];
}
