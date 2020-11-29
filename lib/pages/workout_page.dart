import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = 'workout-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: Text('Workout Page'),
      ),
    );
  }
}
