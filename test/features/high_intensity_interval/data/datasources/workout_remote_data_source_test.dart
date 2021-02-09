import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/features/high_intensity_interval/data/datasources/workout_remote_data_source.dart';
import 'package:workout_app/features/high_intensity_interval/data/models/workout_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  WorkoutRemoteDataSource datasource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = WorkoutRemoteDataSource(client: mockHttpClient);
  });

  // needs to be replaced with the proper tests once backend is in place
  group('getWorkout', () {
    final tWorkoutModel =
        WorkoutModel.fromJson(json.decode(fixture('workout.json')));
    test('should return a WorkoutModel to match json', () async {
      //arrange
      // setUpMockHttpClientSuccess200();
      // act
      final actual = await datasource.getWorkout();
      // assert
      expect(actual, tWorkoutModel);
    });
  });
}
