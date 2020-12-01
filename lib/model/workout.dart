import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';

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
}
