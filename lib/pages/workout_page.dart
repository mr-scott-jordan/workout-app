import 'package:flutter/material.dart';
import 'package:workout_app/model/workout.dart';

// ignore: must_be_immutable
class WorkoutPage extends StatelessWidget {
  static const routeName = 'workout-page';
  Workout workout;
  WorkoutPage(this.workout);
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
