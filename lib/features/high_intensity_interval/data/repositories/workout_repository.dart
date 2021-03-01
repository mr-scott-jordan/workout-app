import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info_type.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../../domain/repositories/workout_repository_type.dart';
import '../datasources/workout_local_data_source.dart';
import '../datasources/workout_remote_data_source.dart';

class WorkoutRepository implements WorkoutRepositoryType {
  final NetworkInfoType networkInfo;
  final WorkoutRemoteDataSourceType remoteDataSource;
  final WorkoutLocalDataSourceType localDataSourceType;

  WorkoutRepository({
    @required this.networkInfo,
    @required this.remoteDataSource,
    @required this.localDataSourceType,
  });

  @override
  Future<Either<Failure, Workout>> getWorkout() async {
    try {
      return Right(await remoteDataSource.getWorkout());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Workout>> generateWorkout({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
    @required int numberOfExercises,
    @required Duration exerciseDuration,
    @required Duration restDuration,
    @required int numberOfRounds,
  }) async {
    return Right(await localDataSourceType.generateWorkout(
      tags: tags,
      equipment: equipment,
      numberOfExercises: numberOfExercises,
      restDuration: restDuration,
      exerciseDuration: exerciseDuration,
      numberOfRounds: numberOfRounds,
    ));
  }
}
