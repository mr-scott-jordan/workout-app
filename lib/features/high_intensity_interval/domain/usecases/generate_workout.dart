import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/workout.dart';
import '../repositories/workout_repository.dart';
import 'get_workout.dart';

class GenerateWorkout implements UseCase<Workout, WorkoutParams> {
  final WorkoutRepository repository;

  GenerateWorkout(this.repository);

// This actually does not need to reach out to the data layer.
// Exercises are generated logically on device and therefore
// that business logic will reside here.
  @override
  Future<Either<Failure, Workout>> call(WorkoutParams params) async {
    return await repository.generateWorkout(
      numberOfExercises: params.numberOfExercises,
      tags: params.tags,
      equipment: params.equipment,
    );
  }
}
