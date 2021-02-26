import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/high_intensity_interval/presentation/bloc/workout_bloc.dart';
import 'features/high_intensity_interval/presentation/pages/equipment_page.dart';
import 'features/high_intensity_interval/presentation/pages/home_page.dart';
import 'features/high_intensity_interval/presentation/pages/workout_setup_page.dart';
import 'injection_container.dart' as ic;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutBloc>(create: (_) => sl<WorkoutBloc>()),
      ],
      child: MaterialApp(
        title: 'Workout App',
        theme: ThemeData(
          brightness: Brightness.dark,
          // primarySwatch: Colors.indigo,
          fontFamily: 'Quicksand',
          accentColor: Colors.black45,
          canvasColor: Color.fromRGBO(42, 79, 122, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          EquipmentPage.routeName: (context) => EquipmentPage(),
          WorkoutSetupPage.routeName: (context) => WorkoutSetupPage(),
          // BulletinBoardPage.routeName: (context) => BulletinBoardPage(_workout),
          // WorkoutPage.routeName: (context) => WorkoutPage(),
        },
      ),
    );
  }
}

class HomeForm {}
