import 'package:flutter/material.dart';
import 'package:workout_app/pages/bulletin_board_page.dart';
import 'package:workout_app/pages/equipment_page.dart';
import 'package:workout_app/pages/workout_page.dart';
import 'package:workout_app/pages/workout_setup_page.dart';

import 'model/workout.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Workout _workout = Workout();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.indigo,
        fontFamily: 'Quicksand',
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(42, 79, 122, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeForm(),
      routes: {
        EquipmentPage.routeName: (context) => EquipmentPage(_workout),
        WorkoutSetupPage.routeName: (context) => WorkoutSetupPage(_workout),
        BulletinBoardPage.routeName: (context) => BulletinBoardPage(_workout),
        WorkoutPage.routeName: (context) => WorkoutPage(_workout),
      },
    );
  }
}
