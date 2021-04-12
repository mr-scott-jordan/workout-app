import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../features/high_intensity_interval/data/models/workout_model.dart';

class SaveWorkoutService {
  static void saveWorkout({
    @required String userId,
    @required WorkoutModel workout,
    String workoutName,
  }) {
    var data;
    workoutName != "" && workoutName != null
        ? data = workout.toJson(
            userId: userId,
            workoutName: workoutName,
          )
        : data = workout.toJson(
            userId: userId,
          );
    FirebaseFirestore.instance
        .collection('workout')
        .add(data)
        .then((value) => 'Workout Saved')
        .catchError(
          (e) => e.toString(),
        );
  }
}
