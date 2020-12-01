import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/model/workout.dart';

// ignore: must_be_immutable
class WorkoutPage extends StatelessWidget {
  static const routeName = 'workout-page';
  Workout workout;
  WorkoutPage(this.workout);

  @override
  Widget build(BuildContext context) {
    workout.setWorkoutDuration();
    var minutes = workout.totalDuration.inMinutes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Placeholder(
              fallbackHeight: 250,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    workout.exercises.elementAt(0).title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      decorationColor: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                alignment: Alignment.centerRight,
                child: Countdown(
                  duration: Duration(
                    minutes: minutes,
                  ),
                  onFinish: () {
                    print('finished!');
                  },
                  builder: (BuildContext ctx, Duration remaining) {
                    return Text(
                      minutes > 9
                          ? '${remaining.toString().substring(2, 7)}'
                          : '${remaining.toString().substring(2, 7)}',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          RaisedButton(
            child: Text('Finish Workout'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
