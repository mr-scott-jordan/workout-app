import 'package:flutter/cupertino.dart';
import 'package:workout_app/core/error/exception.dart';
import 'package:workout_app/core/platform/network_info.dart';
import 'package:workout_app/features/high_intensity_interval/data/datasources/workout_remote_data_source.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository_type.dart';

class WorkoutRepository implements WorkoutRepositoryType {
  final NetworkInfo networkInfo;
  final WorkoutRemoteDataSourceType remoteDataSource;

  WorkoutRepository({
    @required this.networkInfo,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Workout>> generateWorkout(
      {List<Tag> tags, List<Equipment> equipment, int numberOfExercises}) {
    // TODO: implement generateWorkout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Workout>> getWorkout() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getWorkout());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
