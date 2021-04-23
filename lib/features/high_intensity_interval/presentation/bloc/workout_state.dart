part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  getWorkout();
  @override
  List<Object> get props => [];
}

class WorkoutErrorState extends WorkoutState {
  @override
  List<Object> get props => [];

  @override
  getWorkout() {
    throw UnimplementedError();
  }
}

class WorkoutLoadingState extends WorkoutState {
  @override
  List<Object> get props => [];
  @override
  getWorkout() {
    throw UnimplementedError();
  }
}

class WorkoutFinishedState extends WorkoutState {
  final Workout workout;
  WorkoutFinishedState(this.workout);

  @override
  List<Object> get props => [];

  @override
  getWorkout() {
    return this.workout;
  }
}

class ChooseWorkoutFromListState extends WorkoutState {
  final List<Workout> workouts;
  final Workout workout;

  ChooseWorkoutFromListState({
    @required this.workouts,
    @required this.workout,
  });
  @override
  List<Object> get props => [workouts];

  @override
  getWorkout() {
    return this.workout;
  }
}

class WorkoutLoadedState extends WorkoutState {
  final Workout workout;
  WorkoutLoadedState(this.workout);

  // finish this as needed
  WorkoutLoadedState copyWith({
    List<Equipment> equipment,
    List<Tag> tags,
    Duration exerciseDuration,
    Duration restDuration,
    int numOfRounds,
    int numOfExercises,
    List<Exercise> exercises,
    List<Exercise> potentialExercises,
    String workoutName,
  }) {
    return WorkoutLoadedState(
      // we don't want to copy the total duration.  it should be calculated everytime
      Workout(
        equipment: equipment ?? this.workout.equipment,
        tags: tags ?? this.workout.tags,
        exerciseDuration: exerciseDuration ?? this.workout.exerciseDuration,
        restDuration: restDuration ?? this.workout.restDuration,
        totalDuration: _getTotalDuration(
          (numOfRounds ?? this.workout.numOfRounds),
          (numOfExercises ?? this.workout.numOfExercises),
          (restDuration ?? this.workout.restDuration),
          (exerciseDuration ?? this.workout.exerciseDuration),
        ),
        numOfExercises: numOfExercises ?? this.workout.numOfExercises,
        numOfRounds: numOfRounds ?? this.workout.numOfRounds,
        exercises: exercises ?? this.workout.exercises,
        potentialExercises:
            potentialExercises ?? this.workout.potentialExercises,
        workoutName: workoutName ?? this.workout.workoutName,
      ),
    );
  }

  Duration _getTotalDuration(
    int numOfRounds,
    int numOfExercises,
    Duration restDuration,
    Duration exerciseDuration,
  ) {
    return (restDuration + exerciseDuration) * numOfExercises * numOfRounds;
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

  @override
  getWorkout() {
    return this.workout;
  }
}

class RestInProgressState extends WorkoutState {
  final Workout workout;
  RestInProgressState(this.workout);

  @override
  List<Object> get props => [workout];

  @override
  getWorkout() {
    return this.workout;
  }
}

class ExerciseInProgressState extends WorkoutState {
  final Workout workout;
  ExerciseInProgressState(this.workout);

  @override
  List<Object> get props => [workout];

  @override
  getWorkout() {
    return this.workout;
  }
}

class SkipExerciseBufferState extends WorkoutState {
  final Workout workout;
  SkipExerciseBufferState(this.workout);

  @override
  List<Object> get props => [workout];

  @override
  getWorkout() {
    return this.workout;
  }
}

class NewRoundState extends WorkoutState {
  final Workout workout;
  NewRoundState(this.workout);

  @override
  List<Object> get props => [];

  @override
  getWorkout() {
    return this.workout;
  }
}

// this should all be moved into a getInitialWorkout usecase
final List<Exercise> _initialExercises = EXERCISES_DATA.sublist(0, 4);
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
  tags: Tag.values,
  // calculated by (restDuration + exerciseDuration) * numOfExercises * numOfRounds
  // the order matters
  totalDuration: Duration(seconds: 60) * 4 * 4,
  potentialExercises: EXERCISES_DATA.sublist(0),
  workoutName: 'defaultWorkoutName',
);
