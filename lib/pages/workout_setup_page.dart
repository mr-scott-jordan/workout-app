import 'package:flutter/material.dart';

class WorkoutSetupPage extends StatelessWidget {
  static const routeName = 'workout-setup-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: Text('Workout Setup Page'),
      ),
    );
  }
}
