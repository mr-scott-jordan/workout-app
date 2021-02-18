import 'package:get_it/get_it.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/core/network/network_info_type.dart';
import 'package:workout_app/features/high_intensity_interval/data/datasources/workout_local_data_source.dart';
import 'package:workout_app/features/high_intensity_interval/data/datasources/workout_remote_data_source.dart';
import 'package:workout_app/features/high_intensity_interval/data/repositories/workout_repository.dart';
import 'package:workout_app/features/high_intensity_interval/domain/usecases/get_workout.dart';

import 'features/high_intensity_interval/domain/repositories/workout_repository_type.dart';
import 'features/high_intensity_interval/domain/usecases/generate_workout.dart';
import 'features/high_intensity_interval/presentation/bloc/workout_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // ! Features
  // Bloc
  sl.registerFactory(
    () => WorkoutBloc(
      generateWorkout: sl(),
      getWorkout: sl(),
    ),
  );

  //Use cases
  sl
    ..registerLazySingleton(() => GetWorkout(sl()))
    ..registerLazySingleton(() => GenerateWorkout(sl()));

  // Repository
  sl.registerLazySingleton<WorkoutRepositoryType>(() => WorkoutRepository(
        networkInfo: sl(),
        remoteDataSource: sl(),
        localDataSourceType: sl(),
      ));
  // Data sources
  sl
    ..registerLazySingleton<WorkoutRemoteDataSourceType>(
        () => WorkoutRemoteDataSource(
              client: sl(),
            ))
    ..registerLazySingleton<WorkoutLocalDataSourceType>(
        () => WorkoutLocalDataSource()); //! Core

  //! Core
  sl..registerLazySingleton<NetworkInfoType>(() => NetworkInfo(sl()));
  //! External
  sl
    ..registerLazySingleton(() => http.Client())
    ..registerLazySingleton(() => DataConnectionChecker());
}
