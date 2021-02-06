import '../../domain/entities/exercise.dart';
import 'exercise_model.dart';

class ExercisesModel {
  ExercisesModel({List<dynamic> exercises});

  static List<Exercise> fromList(List<dynamic> parsedJson) {
    var exercises = parsedJson.map(
      (exercise) => ExerciseModel.fromJson(
        (exercise),
      ),
    );
    return List<Exercise>.from(exercises);
  }
}
