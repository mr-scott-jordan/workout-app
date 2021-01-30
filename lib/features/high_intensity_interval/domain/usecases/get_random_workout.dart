import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:workout_app/core/usecase/usecase.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';

class GenerateExercises implements UseCase<List<Exercise>, WorkoutParams> {
  final WorkoutRepository repository;

  GenerateExercises(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call(WorkoutParams params) async {
    return await repository.generateExercises(
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
