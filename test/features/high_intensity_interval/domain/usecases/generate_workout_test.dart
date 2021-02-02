import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:workout_app/features/high_intensity_interval/domain/entities/workout.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/generate_workout.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  GenerateWorkout generateWorkout;
  MockWorkoutRepository mockWorkoutRepository;

  setUp(() {
    mockWorkoutRepository = MockWorkoutRepository();
    generateWorkout = GenerateWorkout(mockWorkoutRepository);
  });

  final tWorkout = Workout(
    equipment: [],
    restDuration: null,
    exerciseDuration: null,
    exercises: [],
    numOfExercises: null,
    numOfRounds: null,
    tags: [],
    totalDuration: null,
  );
  final tWorkoutParams = GenerateWorkoutParams(
    numberOfExercises: 1,
    tags: [],
    equipment: [
      Equipment.None,
    ],
  );

  test('should get a list of exercises', () async {
    // arrange
    when(mockWorkoutRepository.generateWorkout(
      tags: [],
      equipment: [
        Equipment.None,
      ],
      numberOfExercises: 1,
    )).thenAnswer((_) async => Right(tWorkout));

    final result = await generateWorkout(tWorkoutParams);

    expect(result, Right(tWorkout));
    verify(
      mockWorkoutRepository.generateWorkout(
        tags: tWorkoutParams.tags,
        equipment: tWorkoutParams.equipment,
        numberOfExercises: tWorkoutParams.numberOfExercises,
      ),
    );
    verifyNoMoreInteractions(mockWorkoutRepository);
  });
}
