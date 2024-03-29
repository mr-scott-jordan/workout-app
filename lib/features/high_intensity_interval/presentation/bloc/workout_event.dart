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

class ResetWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  ResetWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

class SkipWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  SkipWorkoutEvent(this.workout);

  List<Object> get props => [workout];
}

class NewRoundEvent extends WorkoutEvent {
  final Workout workout;

  NewRoundEvent(this.workout);

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

class FinishWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  FinishWorkoutEvent(this.workout);
}

class EditWorkoutNameEvent extends WorkoutEvent {
  final Workout workout;
  final String workoutName;

  EditWorkoutNameEvent({
    @required this.workout,
    @required this.workoutName,
  });
}

class GetWorkoutsEvent extends WorkoutEvent {
  final Workout workout;
  final String userId;
  GetWorkoutsEvent({
    this.workout,
    this.userId,
  });

  List<Object> get props => [workout];
}
