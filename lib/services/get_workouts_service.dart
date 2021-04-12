import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/high_intensity_interval/data/models/workout_model.dart';
import '../features/high_intensity_interval/domain/entities/workout.dart';

class GetWorkoutsService {
  static Future<List<Workout>> getWorkouts(String userId) async {
    List<Map<String, dynamic>> listOfWorkoutData = [];
    var workouts = await FirebaseFirestore.instance
        .collection("workout")
        .where("userId", isEqualTo: userId)
        .get();
    workouts.docs.forEach((workout) {
      listOfWorkoutData.add(workout.data());
    });
    return listOfWorkoutData
        .map((workout) => WorkoutModel.fromJson(workout))
        .toList();
  }
}
