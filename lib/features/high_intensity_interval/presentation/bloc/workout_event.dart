part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// this might not be needed anymore
class InitialWorkoutEvent extends WorkoutEvent {}

class EditWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  EditWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

class StartWorkoutEvent extends WorkoutEvent {}

class GenerateWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  GenerateWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}
