part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EditWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  EditWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

// class StartWorkoutEvent extends WorkoutEvent {}

class GenerateWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  GenerateWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

class StartRestWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  StartRestWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

class StartExerciseWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  StartExerciseWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}
