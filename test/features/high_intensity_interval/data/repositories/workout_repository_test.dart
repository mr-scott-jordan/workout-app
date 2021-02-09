import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_app/core/error/exception.dart';
import 'package:workout_app/core/error/failures.dart';
import 'package:workout_app/core/network/network_info_type.dart';
import 'package:workout_app/features/high_intensity_interval/data/datasources/workout_remote_data_source.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/exercise_model.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/workout_model.dart';
import 'package:workout_app/features/high_intensity_interval/data/repositories/workout_repository.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';

class MockRemoteDataSource extends Mock implements WorkoutRemoteDataSourceType {
}

class MockNetworkInfo extends Mock implements NetworkInfoType {}

void main() {
  WorkoutRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = WorkoutRepository(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  // void runTestsOffline(Function body) {
  //   group('device is offline', () {
  //     setUp(() {
  //       when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  //     });

  //     body();
  //   });
  // }

  group('getWorkout', () {
    final tWorkoutModel = WorkoutModel(
      equipment: [Equipment.None],
      exerciseDuration: Duration(seconds: 30),
      exercises: [
        ExerciseModel(
          equipment: Equipment.None,
          id: 'e1',
          tags: [
            Tag.Push,
          ],
          title: 'Pushup',
        ),
      ],
      numOfExercises: 1,
      numOfRounds: 1,
      restDuration: Duration(seconds: 30),
      tags: [Tag.FullBody],
      totalDuration: Duration(minutes: 1),
    );
    final tWorkout = tWorkoutModel;

    test('should check if the device is online', () {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getWorkout();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getWorkout())
            .thenAnswer((_) async => tWorkoutModel);
        // act
        final result = await repository.getWorkout();
        // assert
        verify(mockRemoteDataSource.getWorkout());
        expect(result, equals(Right(tWorkout)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getWorkout()).thenThrow(ServerException());
        // act
        final result = await repository.getWorkout();
        // assert
        verify(mockRemoteDataSource.getWorkout());
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
