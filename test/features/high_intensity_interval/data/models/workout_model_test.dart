import 'package:flutter_test/flutter_test.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/workout_model.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';

void main() {
  final tWorkoutModel = WorkoutModel(
    equipment: [Equipment.None],
    exerciseDuration: Duration(seconds: 0),
    exercises: [],
    numOfExercises: 0,
    numOfRounds: 0,
    restDuration: Duration(seconds: 0),
    tags: [],
    totalDuration: Duration(seconds: 0),
  );

  test('should be a subclass of Workout Entity', () async {
    // assert
    expect(tWorkoutModel, isA<Workout>());
  });
}
