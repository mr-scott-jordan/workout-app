import 'package:flutter/material.dart';

import 'pages/home.dart';

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
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.redAccent,
        canvasColor: Color.fromRGBO(255, 254, 219, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {},
    );
  }
}
