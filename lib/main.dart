import 'package:flutter/material.dart';
import 'package:workout_app/pages/bulletin_board_page.dart';
import 'package:workout_app/pages/equipment_page.dart';
import 'package:workout_app/pages/workout_page.dart';
import 'package:workout_app/pages/workout_setup_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.indigo,
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(42, 79, 122, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        BulletinBoardPage.routeName: (context) => BulletinBoardPage(),
        EquipmentPage.routeName: (context) => EquipmentPage(),
        WorkoutSetupPage.routeName: (context) => WorkoutSetupPage(),
        WorkoutPage.routeName: (context) => WorkoutPage(),
      },
    );
  }
}
