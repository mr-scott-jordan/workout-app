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
    print(workout);
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
                child: Text(workout.exercises.elementAt(0).toString()),
              ),
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
                      '${remaining.toString().substring(3, 7)}',
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
        ],
      ),
    );
  }
}
