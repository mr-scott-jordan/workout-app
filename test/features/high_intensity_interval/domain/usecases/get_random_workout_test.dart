import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/get_random_workout.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  GenerateExercises generateExercises;
  MockWorkoutRepository mockWorkoutRepository;

  setUp(() {
    mockWorkoutRepository = MockWorkoutRepository();
    generateExercises = GenerateExercises(mockWorkoutRepository);
  });

  final tExercises = [
    Exercise(id: "tId", title: "tTitle", tags: [], equipment: Equipment.None),
  ];
  final tWorkoutParams = WorkoutParams(
    numberOfExercises: 1,
    tags: [],
    equipment: [
      Equipment.None,
    ],
  );

  test('should get a list of exercises', () async {
    // arrange
    when(mockWorkoutRepository.generateExercises(
      tags: [],
      equipment: [
        Equipment.None,
      ],
      numberOfExercises: 1,
    )).thenAnswer((_) async => Right(tExercises));

    final result = await generateExercises(tWorkoutParams);

    expect(result, Right(tExercises));
    verify(
      mockWorkoutRepository.generateExercises(
        tags: tWorkoutParams.tags,
        equipment: tWorkoutParams.equipment,
        numberOfExercises: tWorkoutParams.numberOfExercises,
      ),
    );
    verifyNoMoreInteractions(mockWorkoutRepository);
  });
}
