import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/exercise_data.dart';

import 'exercise.dart';

class Workout {
  List<Tags> tags;
  List<Equipment> equipment;
  Duration exerciseDuration;
  Duration restDuration;
  int numOfRounds;
  int numOfExercises;

  List<Exercise> exercises;

  Workout() {
    this.tags = [];
    this.equipment = [];
    this.exerciseDuration = Duration.zero;
    this.restDuration = Duration.zero;
    this.numOfExercises = 0;
    this.numOfRounds = 0;
    this.exercises = [];
  }

  List<Exercise> _generatePotentialWorkoutList() {
    var exercisesWtihEquipment = EXERCISES_DATA;
    //     .where((exercise) => this.equipment.contains(exercise.equipment))
    //     .toList();
    // var validExercises = exercisesWtihEquipment
    //     .where((exercise) => this.tags.contains(exercise.tags[0]))
    //     .toList();

    return exercisesWtihEquipment;
  }

  void generateWorkoutList() {
    var validExercises = _generatePotentialWorkoutList();
    this.exercises = validExercises;
  }
}
