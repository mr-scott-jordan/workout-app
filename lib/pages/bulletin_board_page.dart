import 'package:flutter/material.dart';
import 'package:workout_app/model/exercise.dart';
import 'package:workout_app/model/workout.dart';

// ignore: must_be_immutable
class BulletinBoardPage extends StatelessWidget {
  static const routeName = 'bulletin-board-page';
  Workout workout;

  BulletinBoardPage(this.workout);
  @override
  Widget build(BuildContext context) {
    workout.generateWorkoutList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: workout.exercises.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 25,
              child: Text(workout.exercises[index].title),
            );
          },
        ),
      ),
    );
  }
}
