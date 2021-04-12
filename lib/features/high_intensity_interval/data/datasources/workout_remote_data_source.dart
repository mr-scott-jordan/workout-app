import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../exercise_data.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../models/exercise_model.dart';
import '../models/workout_model.dart';

abstract class WorkoutRemoteDataSourceType {
  /// Calls endpoint for data
  ///
  /// Throws a [ServerException] for all error codes
  Future<WorkoutModel> getWorkout(String userId);
}

class WorkoutRemoteDataSource implements WorkoutRemoteDataSourceType {
  final http.Client client;

  WorkoutRemoteDataSource({@required this.client});

  @override
  Future<WorkoutModel> getWorkout(String userId) {
    // TODO: Nathan - hook in firebase create in new class dawg
    // https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/lib/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart
    //_getWorkoutFromFirebase();
    print(userId);
    return _getDummyWorkout();
  }

  // returns a hardcoded Workout Model
  Future<WorkoutModel> _getDummyWorkout() async {
    return WorkoutModel(
      equipment: [Equipment.None],
      exerciseDuration: Duration(seconds: 30),
      exercises: [
        ExerciseModel(
          equipment: Equipment.None,
          id: 'e1',
          tags: [
            Tag.Push,
          ],
          title: 'Push-up',
        ),
      ],
      numOfExercises: 1,
      numOfRounds: 1,
      restDuration: Duration(seconds: 30),
      tags: [Tag.FullBody],
      totalDuration: Duration(minutes: 1),
      potentialExercises: EXERCISES_DATA.sublist(0),
      workoutName: 'workoutName',
    );
  }
}
