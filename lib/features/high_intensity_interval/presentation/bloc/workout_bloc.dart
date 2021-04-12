import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../exercise_data.dart';
import '../../../../services/get_workouts_service.dart';
import '../../data/models/workout_model.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../../domain/usecases/generate_workout.dart';
import '../../domain/usecases/get_workout.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final GetWorkout getWorkout;
  final GenerateWorkout generateWorkout;

  WorkoutBloc({
    this.generateWorkout,
    this.getWorkout,
  })  : assert(generateWorkout != null),
        assert(getWorkout != null),
        super(WorkoutLoadedState.initialState());

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is EditWorkoutEvent) {
      yield* _loadWorkout(event.workout);
    } else if (event is GenerateWorkoutEvent) {
      yield* _callGenerateWorkout(event.workout);
    } else if (event is StartRestWorkoutEvent) {
      yield* _startRest(event.workout);
    } else if (event is StartExerciseWorkoutEvent) {
      yield* _startExercise(event.workout);
    } else if (event is FinishWorkoutEvent) {
      yield* _finishWorkout(event.workout);
    } else if (event is ResetWorkoutEvent) {
      yield* _loadWorkout(event.workout);
    } else if (event is GetWorkoutsEvent) {
      yield* _getWorkouts(event.workout, event.userId);
    } else if (event is SkipWorkoutEvent) {
      yield* _skipExercise(event.workout);
    } else if (event is EditWorkoutNameEvent) {
      yield* _editWorkoutName(event.workout, event.workoutName);
    }
  }

  Stream<WorkoutState> _editWorkoutName(
      Workout workout, String workoutName) async* {
    final newWorkout = WorkoutModel(
      workoutName: workoutName,
      equipment: workout.equipment,
      exerciseDuration: workout.exerciseDuration,
      exercises: workout.exercises,
      numOfExercises: workout.numOfExercises,
      numOfRounds: workout.numOfRounds,
      potentialExercises: workout.potentialExercises,
      restDuration: workout.restDuration,
      tags: workout.tags,
      totalDuration: workout.totalDuration,
    );
    final result = WorkoutFinishedState(newWorkout);
    yield result;
  }

  Stream<WorkoutState> _finishWorkout(Workout workout) async* {
    final result = WorkoutFinishedState(workout);
    yield result;
  }

  Stream<WorkoutState> _startRest(Workout workout) async* {
    final result = RestInProgressState(workout);
    yield result;
  }

  Stream<WorkoutState> _startExercise(Workout workout) async* {
    final result = ExerciseInProgressState(workout);
    yield result;
  }

  Stream<WorkoutState> _getWorkouts(Workout workout, String userId) async* {
    final workouts = await GetWorkoutsService.getWorkouts(userId);
    final result = ChooseWorkoutFromListState(
      workouts: workouts,
      workout: workout,
    );
    yield result;
  }

  Stream<WorkoutState> _skipExercise(Workout workout) async* {
    final result = SkipExerciseBufferState(workout);
    yield result;
  }

  Stream<WorkoutState> _callGenerateWorkout(Workout workout) async* {
    final GenerateWorkoutParams params = GenerateWorkoutParams(
      numberOfExercises: workout.numOfExercises,
      tags: workout.tags,
      equipment: workout.equipment,
      exerciseDuration: workout.exerciseDuration,
      restDuration: workout.restDuration,
      numberOfRounds: workout.numOfRounds,
      workoutName: workout.workoutName,
    );
    final result = await generateWorkout.call(params);

    yield result.fold(
      (failure) => WorkoutErrorState(),
      (response) => WorkoutLoadedState(response),
    );
  }

  Stream<WorkoutState> _loadWorkout(Workout workout) async* {
    final result = WorkoutLoadedState(workout);
    yield result;
  }
}
