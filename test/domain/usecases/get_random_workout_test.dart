import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/features/high_intensity_interval/domain/entities/exercise.dart';
import 'package:workout_app/features/high_intensity_interval/domain/repositories/workout_repository.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/get_random_workout.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {
  void main() {
    GetRandomWorkout getRandomWorkout;
    MockWorkoutRepository mockWorkoutRepository;

    setUp(() {
      mockWorkoutRepository = MockWorkoutRepository();
      getRandomWorkout = GetRandomWorkout(mockWorkoutRepository);
    });
    final tWorkout = [
      
    ]
    final tExercises = [
      Exercise(
          id: "tId",
          title: "tTitle",
          tags: ["test"],
          equipment: Equipment.None),
      Exercise(
          id: "tId",
          title: "tTitle",
          tags: ["test"],
          equipment: Equipment.None),
    ];
    test('should get a list of exercises', () async {
      // arrange
      when(mockWorkoutRepository.getRandomExercises(any))
          .thenAnswer((_) async => Right(tExercises));

      final result = await getRandomExercises();
    });
  }
}
