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
  WorkoutLoadedState copyWith({
    List<Equipment> equipment,
    List<Tag> tags,
    Duration exerciseDuration,
    Duration restDuration,
    int numOfRounds,
    int numOfExercises,
    List<Exercise> exercises,
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
}

class RestInProgressState extends WorkoutState {
  final Workout workout;
  RestInProgressState(this.workout);

  @override
  List<Object> get props => [workout];
}

class ExerciseInProgressState extends WorkoutState {
  final Workout workout;
  ExerciseInProgressState(this.workout);

  @override
  List<Object> get props => [workout];
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
