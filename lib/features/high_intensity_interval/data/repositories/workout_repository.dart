import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info_type.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../../domain/repositories/workout_repository_type.dart';
import '../datasources/workout_remote_data_source.dart';

class WorkoutRepository implements WorkoutRepositoryType {
  final NetworkInfoType networkInfo;
  final WorkoutRemoteDataSourceType remoteDataSource;

  WorkoutRepository({
    @required this.networkInfo,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Workout>> generateWorkout(
      {List<Tag> tags, List<Equipment> equipment, int numberOfExercises}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Workout>> getWorkout() async {
    try {
      return Right(await remoteDataSource.getWorkout());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
