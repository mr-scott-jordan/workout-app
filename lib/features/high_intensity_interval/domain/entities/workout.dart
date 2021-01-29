import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/enums/tags.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';

class Workout extends Equatable {
  final List<Tags> tags;
  final List<Equipment> equipment;
  final Duration exerciseDuration;
  final Duration restDuration;
  final int numOfRounds;
  final int numOfExercises;
  final Duration totalDuration;

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
      ];
}
