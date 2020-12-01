import 'package:flutter/material.dart';
import 'package:workout_app/model/workout.dart';

class BulletinBoardPage extends StatelessWidget {
  static const routeName = 'bulletin-board-page';
  Workout workout;

  BulletinBoardPage(this.workout);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: Text('Bulletin Board Page'),
      ),
    );
  }
}
