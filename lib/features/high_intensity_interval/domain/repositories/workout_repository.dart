import 'package:dartz/dartz.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Exercise>>> getRandomExercises(Workout workout);
}
