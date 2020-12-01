import 'package:flutter/material.dart';
import 'package:workout_app/exercise_data.dart';
import 'package:workout_app/model/workout.dart';
import 'package:workout_app/pages/primary-drawer.dart';
import 'package:workout_app/pages/workout_page.dart';

// ignore: must_be_immutable
class BulletinBoardPage extends StatefulWidget {
  static const routeName = 'bulletin-board-page';
  Workout workout;

  BulletinBoardPage(this.workout);

  @override
  _BulletinBoardPageState createState() => _BulletinBoardPageState();
}

class _BulletinBoardPageState extends State<BulletinBoardPage> {
  @override
  void initState() {
    widget.workout.generateWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.workout.setWorkoutDuration();
    var potentialExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    potentialExercises.shuffle();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      drawer: PrimaryDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              (widget.workout.totalDuration.toString().split('.')[0]),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: widget.workout.exercises.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // leading: Text(
                  //   workout.exercises[index].title,
                  //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  // ),
                  title: Text(
                    widget.workout.exercises[index].title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(Icons.swap_calls_rounded),
                            onPressed: () {
                              setState(() {
                                widget.workout.exercises[index] =
                                    potentialExercises.firstWhere((element) =>
                                        element !=
                                        widget.workout.exercises[index]);
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                var didRemove =
                                    widget.workout.exercises.removeAt(index);
                                widget.workout.numOfExercises =
                                    widget.workout.numOfExercises - 1;
                                print(didRemove);
                              });
                            }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text('Regenerate Workout'),
            onPressed: () {
              setState(() {
                widget.workout.generateWorkout();
              });
            },
          ),
          RaisedButton(
            child: Text('Begin Workout'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                WorkoutPage.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
