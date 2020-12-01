import 'package:flutter/material.dart';
import 'package:workout_app/model/workout.dart';
import 'package:workout_app/pages/bulletin_board_page.dart';
import 'package:workout_app/pages/primary_drawer.dart';

import '../enums/tags.dart';

// ignore: must_be_immutable
class WorkoutSetupPage extends StatefulWidget {
  static const routeName = 'workout-setup-page';
  Workout workout;

  WorkoutSetupPage(
    this.workout,
  );
  @override
  _WorkoutSetupPageState createState() => _WorkoutSetupPageState();
}

class _WorkoutSetupPageState extends State<WorkoutSetupPage> {
  String _exerciseDuration;
  String _restDuration;
  String _numberOfExercises;
  String _numberOfRounds;

  bool _fullbody;
  bool _push;
  bool _pull;
  bool _legs;
  bool _core;

  Widget _buildDropDown(String title, String stateValue,
      List<String> possibleValues, Function onChanged) {
    return Column(
      children: [
        Text(title),
        Container(
          width: 150,
          // height: 100,
          child: DropdownButton(
            value: stateValue,
            elevation: 4,
            underline: Container(
              color: Colors.white,
              height: 2,
            ),
            onChanged: onChanged,
            items: possibleValues
                .map(
                  (e) => DropdownMenuItem(child: Text(e), value: e),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    _exerciseDuration = '00:45';
    _restDuration = '00:10';
    _numberOfExercises = '6';
    _numberOfRounds = '4';
    _pull = false;
    _push = false;
    _core = false;
    _legs = false;
    _fullbody = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var minutes;
    var seconds;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout Setup'),
      ),
      drawer: PrimaryDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildDropDown(
                'Exercise Duration',
                _exerciseDuration,
                [
                  '00:45',
                  '01:00',
                  '01:15',
                  '01:30',
                ],
                (newValue) {
                  setState(() {
                    _exerciseDuration = newValue;
                    minutes = int.parse(_exerciseDuration.split(':')[0]);
                    seconds = int.parse(_exerciseDuration.split(':')[1]);
                    widget.workout.exerciseDuration =
                        Duration(minutes: minutes, seconds: seconds);
                  });
                },
              ),
              _buildDropDown(
                'Rest Duration',
                _restDuration,
                [
                  '00:05',
                  '00:10',
                  '00:15',
                  '00:20',
                ],
                (newValue) {
                  setState(() {
                    _restDuration = newValue;
                    minutes = int.parse(_restDuration.split(':')[0]);
                    seconds = int.parse(_restDuration.split(':')[1]);
                    widget.workout.restDuration =
                        Duration(minutes: minutes, seconds: seconds);
                  });
                },
              ),
              _buildDropDown(
                'Number of Exercises',
                _numberOfExercises,
                [
                  '3',
                  '4',
                  '5',
                  '6',
                ],
                (newValue) {
                  setState(() {
                    _numberOfExercises = newValue;
                    widget.workout.numOfExercises =
                        int.parse(_numberOfExercises);
                  });
                },
              ),
              _buildDropDown(
                'Number of Rounds',
                _numberOfRounds,
                [
                  '3',
                  '4',
                  '5',
                  '6',
                ],
                (newValue) {
                  setState(() {
                    _numberOfRounds = newValue;
                    widget.workout.numOfRounds = int.parse(_numberOfRounds);
                  });
                },
              ),
              SwitchListTile(
                  title: Text('Push'),
                  value: _push,
                  onChanged: (value) {
                    setState(() {
                      _push = value;
                      value
                          ? widget.workout.tags.add(Tags.Push)
                          : widget.workout.tags.remove(Tags.Push);
                      print(_push);
                    });
                  }),
              SwitchListTile(
                  title: Text('Pull'),
                  value: _pull,
                  onChanged: (value) {
                    setState(() {
                      _pull = value;
                      value
                          ? widget.workout.tags.add(Tags.Pull)
                          : widget.workout.tags.remove(Tags.Pull);
                      print(_pull);
                    });
                  }),
              SwitchListTile(
                  title: Text('Legs'),
                  value: _legs,
                  onChanged: (value) {
                    setState(() {
                      _legs = value;
                      value
                          ? widget.workout.tags.add(Tags.Legs)
                          : widget.workout.tags.remove(Tags.Legs);
                      print(_legs);
                    });
                  }),
              SwitchListTile(
                  title: Text('Core'),
                  value: _core,
                  onChanged: (value) {
                    setState(() {
                      _core = value;
                      value
                          ? widget.workout.tags.add(Tags.Core)
                          : widget.workout.tags.remove(Tags.Core);
                      print(_core);
                    });
                  }),
              SwitchListTile(
                  title: Text('FullBody'),
                  value: _fullbody,
                  onChanged: (value) {
                    setState(() {
                      _fullbody = value;
                      value
                          ? widget.workout.tags.add(Tags.FullBody)
                          : widget.workout.tags.remove(Tags.FullBody);
                      print(_fullbody);
                    });
                  }),
              RaisedButton(
                child: Text('Load Workout'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    BulletinBoardPage.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
