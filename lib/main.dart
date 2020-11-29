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
        brightness: Brightness.dark,
        // primarySwatch: Colors.indigo,
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(42, 79, 122, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        // add new routes here
      },
    );
  }
}
