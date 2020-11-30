import 'package:flutter/material.dart';
import 'package:workout_app/pages/workout_page.dart';

import '../enums/tags.dart';

class WorkoutSetupPage extends StatefulWidget {
  static const routeName = 'workout-setup-page';
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

  List<Tags> _tags;

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
    _tags = [];
    _pull = false;
    _push = false;
    _core = false;
    _legs = false;
    _fullbody = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout Setup'),
      ),
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
                  '00:30',
                  '00:45',
                  '01:00',
                  '01:15',
                  '01:30',
                ],
                (newValue) {
                  setState(() {
                    _exerciseDuration = newValue;
                    print(_exerciseDuration);
                  });
                },
              ),
              _buildDropDown(
                'Rest Duration',
                _restDuration,
                ['00:05', '00:10', '00:15', '00:20'],
                (newValue) {
                  setState(() {
                    _restDuration = newValue;
                    print(_restDuration);
                  });
                },
              ),
              _buildDropDown(
                'Number of Exercises',
                _numberOfExercises,
                ['3', '4', '5', '6'],
                (newValue) {
                  setState(() {
                    _numberOfExercises = newValue;
                    print(_numberOfExercises);
                  });
                },
              ),
              _buildDropDown(
                'Number of Rounds',
                _numberOfRounds,
                ['3', '4', '5', '6'],
                (newValue) {
                  setState(() {
                    _numberOfRounds = newValue;
                    print(_numberOfRounds);
                  });
                },
              ),
              SwitchListTile(
                  title: Text('Push'),
                  value: _push,
                  onChanged: (value) {
                    setState(() {
                      _push = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('Pull'),
                  value: _pull,
                  onChanged: (value) {
                    setState(() {
                      _pull = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('Legs'),
                  value: _legs,
                  onChanged: (value) {
                    setState(() {
                      _legs = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('Core'),
                  value: _core,
                  onChanged: (value) {
                    setState(() {
                      _core = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('FullBody'),
                  value: _fullbody,
                  onChanged: (value) {
                    setState(() {
                      _fullbody = value;
                    });
                  }),
              RaisedButton(
                  child: Text('Load Workout'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      WorkoutPage.routeName,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
