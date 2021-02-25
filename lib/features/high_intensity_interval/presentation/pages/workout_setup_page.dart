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
                            'Exercise Duration in Seconds',
                            // we have to convert out duration to seconds and it
                            // must match one item in the possible values
                            state.workout.exerciseDuration.inSeconds.toString(),
                            [
                              '40',
                              '60',
                              '75',
                              '90',
                            ],
                            (value) {
                              var exerciseDuration =
                                  Duration(seconds: int.parse(value));
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(
                                          exerciseDuration: exerciseDuration)
                                      .workout));
                            },
                          ),
                          _buildDropDown(
                            'Rest Duration in Seconds',
                            // we have to convert out duration to seconds and it
                            // must match one item in the possible values
                            state.workout.restDuration.inSeconds.toString(),
                            [
                              '10',
                              '15',
                              '20',
                              '30',
                            ],
                            (value) {
                              var restDuration =
                                  Duration(seconds: int.parse(value));
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(restDuration: restDuration)
                                      .workout));
                            },
                          ),
                          _buildDropDown(
                            'Number of Exercises',
                            state.workout.numOfExercises.toString(),
                            [
                              '3',
                              '4',
                              '5',
                              '6',
                            ],
                            (value) {
                              // the logic here is just copying the same numOfExercises
                              var numOfExercises = state.workout.numOfExercises;
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(numOfExercises: numOfExercises)
                                      .workout));
                            },
                          ),
                          _buildDropDown(
                            'Number of Rounds',
                            state.workout.numOfRounds.toString(),
                            [
                              '3',
                              '4',
                              '5',
                              '6',
                            ],
                            (value) {
                              // the logic here is just copying the same numOfRounds
                              var numOfRounds = state.workout.numOfRounds;
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(numOfRounds: numOfRounds)
                                      .workout));
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
                              value: _tagStringToBool(
                                  tagName: 'Pull', tags: state.workout.tags),
                              onChanged: (value) {
                                var tags = state.workout.tags.sublist(0);
                                value
                                    ? tags.add(Tag.Pull)
                                    : tags.remove(Tag.Pull);
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutEvent(
                                        state.copyWith(tags: tags).workout));
                              }),
                          SwitchListTile(
                              activeColor: Color(0xfffbc02d),
                              title: Text('Legs'),
                              value: _tagStringToBool(
                                  tagName: 'Legs', tags: state.workout.tags),
                              onChanged: (value) {
                                var tags = state.workout.tags.sublist(0);
                                value
                                    ? tags.add(Tag.Legs)
                                    : tags.remove(Tag.Legs);
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutEvent(
                                        state.copyWith(tags: tags).workout));
                              }),
                          SwitchListTile(
                              activeColor: Color(0xfffbc02d),
                              title: Text('Core'),
                              value: _tagStringToBool(
                                  tagName: 'Core', tags: state.workout.tags),
                              onChanged: (value) {
                                var tags = state.workout.tags.sublist(0);
                                value
                                    ? tags.add(Tag.Core)
                                    : tags.remove(Tag.Core);
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutEvent(
                                        state.copyWith(tags: tags).workout));
                              }),
                          SwitchListTile(
                              activeColor: Color(0xfffbc02d),
                              title: Text('FullBody'),
                              value: _tagStringToBool(
                                  tagName: 'FullBody',
                                  tags: state.workout.tags),
                              onChanged: (value) {
                                var tags = state.workout.tags.sublist(0);
                                value
                                    ? tags.add(Tag.FullBody)
                                    : tags.remove(Tag.FullBody);
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutEvent(
                                        state.copyWith(tags: tags).workout));
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
  // the value passed here must exist in possible values
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
