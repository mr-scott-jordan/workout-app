import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../exercise_data.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/equipment.dart';
import '../../domain/enums/tag.dart';
import '../../domain/usecases/generate_workout.dart';
import '../../domain/usecases/get_workout.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  // need firebase before _getWorkout can be used
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
      yield WorkoutLoadingState();
      yield* _loadWorkout(event.workout);
    } else if (event is GenerateWorkoutEvent) {
      yield WorkoutLoadingState();
      yield* _callGenerateWorkout(event.workout);
    } else if (event is GetWorkoutsEvent) {
      yield* _getWorkouts(event.workout, event.userId);
    }
  }

  Stream<WorkoutState> _getWorkouts(Workout workout, String userId) async* {
    //need to call usecase later
    final result = ChooseWorkoutListState(
      [workout, workout],
    );
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
