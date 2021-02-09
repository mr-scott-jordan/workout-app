import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../models/exercise_model.dart';
import '../models/workout_model.dart';

abstract class WorkoutRemoteDataSourceType {
  /// Calls endpoint for data
  ///
  /// Throws a [ServerException] for all error codes
  Future<WorkoutModel> getWorkout();
}

class WorkoutRemoteDataSource implements WorkoutRemoteDataSourceType {
  final http.Client client;

  WorkoutRemoteDataSource({@required this.client});

  @override
  Future<WorkoutModel> getWorkout() {
    return _getDummyWorkout();
    // TODO: Nathan - hook in firebase
    //_getWorkoutFromFirebase();
  }

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
          title: 'Pushup',
        ),
      ],
      numOfExercises: 1,
      numOfRounds: 1,
      restDuration: Duration(seconds: 30),
      tags: [Tag.FullBody],
      totalDuration: Duration(minutes: 1),
    );
  }
}
