import '../../domain/entities/exercise.dart';
import 'exercise_model.dart';

class ExercisesModel {
  ExercisesModel({List<dynamic> exercises});

  static List<Exercise> fromList(List<dynamic> parsedJson) {
    var exercises = parsedJson.map(
      (exercise) => ExerciseModel.fromJson(exercise),
    );
    return List<Exercise>.from(exercises);
  }

  static List<Map<String, dynamic>> toList(List<Exercise> exercises) {
    return exercises.map((exercise) => ExerciseModel.toJson(exercise)).toList();
  }
}
