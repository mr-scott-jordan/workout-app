import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_app/exercise_data.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/generate_workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/get_workout.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/bloc/workout_bloc.dart';

class MockGenerateWorkout extends Mock implements GenerateWorkout {}

class MockGetWorkout extends Mock implements GetWorkout {}

void main() {
  WorkoutBloc bloc;
  MockGenerateWorkout mockGenerateWorkout;
  MockGetWorkout mockGetWorkout;

  setUp(() {
    mockGetWorkout = MockGetWorkout();
    mockGenerateWorkout = MockGenerateWorkout();

    bloc = WorkoutBloc(
        generateWorkout: mockGenerateWorkout, getWorkout: mockGetWorkout);
  });

  test('initial state should be WorkoutLoaded', () {
    // assert
    expect(bloc.state, equals(WorkoutLoadedState.initialState()));
  });

  group('GenerateWorkout', () {
    final tEquipment = [Equipment.PullUpBar];
    final tExerciseDuration = Duration(seconds: 40);
    final tExercises = EXERCISES_DATA.sublist(0, 3);
    final tNumOfExercises = 4;
    final tNumOfRounds = 4;
    final tRestDuration = Duration(seconds: 20);
    final tTags = tExercises.map((e) => e.tags.single).toList();
    final tTotalDuration =
        (tRestDuration + tExerciseDuration) * tNumOfRounds * tNumOfExercises;

    final tWorkout = Workout(
      equipment: tEquipment,
      exerciseDuration: tExerciseDuration,
      exercises: tExercises,
      numOfExercises: tNumOfExercises,
      numOfRounds: tNumOfRounds,
      restDuration: tRestDuration,
      tags: tTags,
      totalDuration: tTotalDuration,
    );

    test('should generate workout from use case', () async {
      // arrange
      when(mockGenerateWorkout(any)).thenAnswer((_) async => Right(tWorkout));

      // assert later
      final expected = [
        WorkoutLoadingState(),
        WorkoutLoadedState(tWorkout),
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(GenerateWorkoutEvent(tWorkout));
    });

    test(
        'should emit [WorkoutLoadingState, WorkoutLoadedState] when user edits their workout',
        () async {
      // arrange
      final tEditedWorkout = Workout(
        equipment: tEquipment,
        exerciseDuration: tExerciseDuration,
        exercises: [],
        numOfExercises: tNumOfExercises,
        numOfRounds: tNumOfRounds,
        restDuration: tRestDuration,
        tags: tTags,
        totalDuration: tTotalDuration,
      );
      // assert later
      final expected = [
        WorkoutLoadingState(),
        WorkoutLoadedState(tEditedWorkout),
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(EditWorkoutEvent(tEditedWorkout));
    });
  });
}
