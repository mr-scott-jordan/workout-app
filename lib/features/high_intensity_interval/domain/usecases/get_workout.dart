import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/workout.dart';
import '../repositories/workout_repository_type.dart';

class GetWorkout implements UseCase<Workout, NoParams> {
  final WorkoutRepositoryType repository;

  GetWorkout(this.repository);

  @override
  Future<Either<Failure, Workout>> call(NoParams noParams) async {
    return await repository.getWorkout();
  }
}
