import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/features/high_intensity_interval/domain/enums/tag.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/widgets/formatted_button.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/widgets/page_animation_widget.dart';

import '../bloc/workout_bloc.dart';
import 'home_page.dart';

class WorkoutSetupPage extends StatelessWidget {
  static const routeName = 'workout-setup-page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      // check state and build ui
      if (state is WorkoutLoadedState) {
        return PageAnimationWidget(
          body: Container(
            color: Color(0xff424242),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total Workout Duration:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xfffbc02d),
                            ),
                          ),
                          Text(
                            (state.workout.totalDuration
                                .toString()
                                .split('.')[0]),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2.0,
                        width: double.infinity,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildDropDown(
                            'Exercise Duration',
                            state.workout.exerciseDuration.toString(),
                            [
                              '00:45',
                              '01:00',
                              '01:15',
                              '01:30',
                            ],
                            (value) {
                              var minutes = int.parse(value.split(':')[0]);
                              var seconds = int.parse(value.split(':')[1]);
                              var exerciseDuration =
                                  Duration(minutes: minutes, seconds: seconds);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(
                                          exerciseDuration: exerciseDuration)
                                      .workout));
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
                                minutes =
                                    int.parse(_restDuration.split(':')[0]);
                                seconds =
                                    int.parse(_restDuration.split(':')[1]);
                                widget.workout.restDuration = Duration(
                                    minutes: minutes, seconds: seconds);
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
                                widget.workout.numOfRounds =
                                    int.parse(_numberOfRounds);
                              });
                            },
                          ),
                          SwitchListTile(
                              activeColor: Color(0xfffbc02d),
                              title: Text('Push'),
                              value: _tagStringToBool(
                                  tagName: 'Push', tags: state.workout.tags),
                              onChanged: (value) {
                                var tags = state.workout.tags.sublist(0);
                                value
                                    ? tags.add(Tag.Push)
                                    : tags.remove(Tag.Push);
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutEvent(
                                        state.copyWith(tags: tags).workout));
                              }),
                          SwitchListTile(
                              activeColor: Color(0xfffbc02d),
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
                              activeColor: Color(0xfffbc02d),
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
                              activeColor: Color(0xfffbc02d),
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
                              activeColor: Color(0xfffbc02d),
                              title: Text('FullBody'),
                              value: _fullbody,
                              onChanged: (value) {
                                setState(() {
                                  _fullbody = value;
                                  value
                                      ? widget.workout.tags.add(Tags.FullBody)
                                      : widget.workout.tags
                                          .remove(Tags.FullBody);
                                  print(_fullbody);
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2.0,
                        width: double.infinity,
                        color: Colors.purple,
                      ),
                      FormattedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            // TODO: (Scott) fix routing when all pages marged
                            HomePage.routeName,
                            //BulletinBoardPage.routeName,
                          );
                        },
                        buttonText: "Load Workout",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text('An error occured'),
          ),
        );
      }
    });
  }
}

Widget _buildDropDown(
  String title,
  String stateValue,
  List<String> possibleValues,
  Function onChanged,
) {
  return Column(
    children: [
      Text(title),
      Container(
        width: 150,
        // height: 100,
        child: DropdownButton(
          dropdownColor: Color(0xff424242),
          value: stateValue,
          elevation: 4,
          underline: Container(
            color: Colors.purple,
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

const _kMap = {
  'Fullbody': Tag.FullBody,
  'Pull': Tag.Pull,
  'Push': Tag.Push,
  'Core': Tag.Core,
  'Legs': Tag.Legs,
};

bool _tagStringToBool({@required String tagName, @required List<Tag> tags}) {
  return tags.any((tag) => tags.contains(_kMap[tagName]));
}
