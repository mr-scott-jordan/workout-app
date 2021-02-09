import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/exercise_model.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/workout_model.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';
import '';

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
    _getDummyWorkout();
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
