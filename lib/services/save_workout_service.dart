import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/high_intensity_interval/data/models/workout_model.dart';

class SaveWorkoutService {
  static Future<String> saveWorkout(String userId, WorkoutModel workout) {
    final data = workout.toJson(userId);
    FirebaseFirestore.instance
        .collection('workout')
        .add(data)
        .then((value) => 'Workout Saved')
        .catchError(
          (e) => e.toString(),
        );
  }
}
