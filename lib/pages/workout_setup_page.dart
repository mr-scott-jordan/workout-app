import 'package:flutter/material.dart';

class WorkoutSetupPage extends StatefulWidget {
  static const routeName = 'workout-setup-page';
  @override
  _WorkoutSetupPageState createState() => _WorkoutSetupPageState();
}

class _WorkoutSetupPageState extends State<WorkoutSetupPage> {
  String _workDuration;
  String _restDuration;
  String _numberOfExercises;
  String _numberOfRounds;

  Widget _buildDropDown(String title, String stateValue,
      List<String> possibleValues, Function onChanged) {
    return Column(
      children: [
        Text(title),
        Container(
          width: 100,
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
    _workDuration = '00:45';
    _restDuration = '00:10';
    _numberOfExercises = '6';
    _numberOfRounds = '4';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildDropDown(
                'Workout Duration',
                _workDuration,
                [
                  '00:30',
                  '00:45',
                  '01:00',
                  '01:15',
                  '01:30',
                ],
                (newValue) {
                  setState(() {
                    _workDuration = newValue;
                    print(_workDuration);
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
            ],
          ),
        ),
      ),
    );
  }
}
