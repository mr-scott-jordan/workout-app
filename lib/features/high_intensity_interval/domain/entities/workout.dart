import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums/equipment.dart';
import '../enums/tag.dart';
import 'exercise.dart';

class Workout extends Equatable {
  final List<Tag> tags;
  final List<Equipment> equipment;
  final Duration exerciseDuration;
  final Duration restDuration;
  final int numOfRounds;
  final int numOfExercises;
  final Duration totalDuration;

  final List<Exercise> potentialExercises;
  final List<Exercise> exercises;

  Workout({
    @required this.tags,
    @required this.equipment,
    @required this.exerciseDuration,
    @required this.restDuration,
    @required this.numOfRounds,
    @required this.numOfExercises,
    @required this.exercises,
    @required this.totalDuration,
    @required this.potentialExercises,
  });

  @override
  List<Object> get props => [
        tags,
        equipment,
        exerciseDuration,
        restDuration,
        numOfRounds,
        numOfExercises,
        exercises,
        totalDuration,
        potentialExercises,
      ];
}
