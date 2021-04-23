import 'package:flutter/material.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';

import '../exercise_data.dart';

class GetPotentialExercisesService {
  static List<Exercise> getExercises({
    @required List<Tag> tags,
    @required List<Equipment> equipment,
  }) {
    var listOfAllExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    List<Exercise> potentialExercises = [];

    listOfAllExercises.forEach((element) {
      if (element.tags.every((item) => tags.contains(item)) &&
          equipment.contains(element.equipment)) {
        potentialExercises.add(element);
      }
    });
    return potentialExercises;
  }
}
