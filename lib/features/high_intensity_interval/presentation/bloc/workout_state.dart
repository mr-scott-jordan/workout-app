part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  @override
  List<Object> get props => [];
}

class WorkoutErrorState extends WorkoutState {
  @override
  List<Object> get props => [];
}

class WorkoutLoadingState extends WorkoutState {
  @override
  List<Object> get props => [];
}

class WorkoutLoadedState extends WorkoutState {
  final Workout workout;
  WorkoutLoadedState(this.workout);

  // finish this as needed
  WorkoutLoadedState copyWith(Workout workout) {
    return WorkoutLoadedState(workout ?? this.workout);
  }

  static WorkoutLoadedState initialState() {
    return WorkoutLoadedState(
      _initialWorkout,
    );
  }

  @override
  List<Object> get props => [
        workout,
      ];
}

class WorkoutInProgressState extends WorkoutState {
  @override
  List<Object> get props => [];
}

// this should all be moved into a getInitialWorkout usecase
final List<Exercise> _initialExercises = EXERCISES_DATA.sublist(0, 3);
final Workout _initialWorkout = Workout(
  equipment: [
    Equipment.None,
  ],
  exerciseDuration: Duration(seconds: 40),
  exercises: _initialExercises,
  numOfExercises: 4,
  numOfRounds: 4,
  restDuration: Duration(seconds: 20),
  // gather all the tags from the workout
  tags: _initialExercises.map((element) {
    return element.tags.single;
  }).toList(),
  // calculated by (restDuration + exerciseDuration) * numOfExercises * numOfRounds
  // the order matters
  totalDuration: Duration(seconds: 60) * 4 * 4,
);
