part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
}

class WorkoutInitial extends WorkoutState {
  @override
  List<Object> get props => [];
}
