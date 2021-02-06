import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/exercise_model.dart';

import 'package:workout_app/features/high_intensity_interval/data/models/workout_model.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
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

  test('should be a subclass of Workout Entity', () async {
    // assert
    expect(tWorkoutModel, isA<Workout>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON is proper', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('workout.json'));
      // act
      final result = WorkoutModel.fromJson(jsonMap);
      // assert
      expect(result, equals(tWorkoutModel));
    });
  });
}
