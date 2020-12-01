import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/exercise_data.dart';

import 'exercise.dart';

class Workout {
  List<Tags> tags;
  List<Equipment> equipment;
  Duration exerciseDuration;
  Duration restDuration;
  Duration totalDuration;
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

  void generateWorkout() {
    var listOfAllExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    listOfAllExercises.shuffle();
    this.exercises = List.generate(
        numOfExercises, (index) => listOfAllExercises.elementAt(index));
  }

  void setWorkoutDuration() {
    var intervalDuration = this.exerciseDuration + this.restDuration;
    var setDuration = intervalDuration * this.numOfExercises;
    this.totalDuration = setDuration * this.numOfRounds;
  }
}
