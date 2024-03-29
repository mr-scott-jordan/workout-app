import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay/overlay.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import '../widgets/timer.dart';
import 'login_page.dart';
import 'workout_summary_page.dart';
//import '../'

// ignore: must_be_immutable
class WorkoutPage extends StatelessWidget {
  static const routeName = '/workout-page';
  final CountDownController controller = CountDownController();
  List<Exercise> exercises;
  int roundIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (BuildContext context, state) {
        if (state is UserUnauthenticatedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.routeName,
            (route) => false,
          );
        }
      },
      child:
          BlocConsumer<WorkoutBloc, WorkoutState>(listener: (context, state) {
        if (state is WorkoutFinishedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            WorkoutSummaryPage.routeName,
            (route) => false,
          );
        }
      }, builder: (context, state) {
        if (state is WorkoutLoadedState) {
          exercises = state.workout.exercises.reversed.toList();
          roundIndex = 1;
          BlocProvider.of<WorkoutBloc>(context)
              .add(StartRestWorkoutEvent(state.workout));
          return Container();
        } else if (state is NewRoundState) {
          exercises = state.workout.exercises.reversed.toList();
          roundIndex++;
          if (roundIndex <= state.workout.numOfRounds)
            BlocProvider.of<WorkoutBloc>(context)
                .add(StartRestWorkoutEvent(state.workout));
          else
            BlocProvider.of<WorkoutBloc>(context)
                .add(FinishWorkoutEvent(state.workout));
          return Container();
        } else if (state is RestInProgressState) {
          print(state);
          final Function onComplete = () {
            BlocProvider.of<WorkoutBloc>(context)
                .add(StartExerciseWorkoutEvent(state.workout));
            controller.restart(
              duration: state.workout.exerciseDuration.inSeconds,
            );
          };
          final pageParams = Params(
              context: context,
              workout: state.workout,
              onComplete: onComplete,
              exerciseText: 'Next Exercise:',
              taskText: 'REST',
              stateDuration: state.workout.restDuration.inSeconds,
              exercises: exercises,
              controller: controller,
              roundIndex: roundIndex);
          return _buildPage(pageParams);
        } else if (state is ExerciseInProgressState) {
          print(state);
          final Function onComplete = () {
            exercises.removeLast();
            if (exercises.isEmpty) {
              BlocProvider.of<WorkoutBloc>(context)
                  .add(NewRoundEvent(state.workout));
            } else {
              BlocProvider.of<WorkoutBloc>(context)
                  .add(StartRestWorkoutEvent(state.workout));
              controller.restart(
                duration: state.workout.restDuration.inSeconds,
              );
            }
          };
          final pageParams = Params(
            context: context,
            workout: state.workout,
            onComplete: onComplete,
            exerciseText: 'Current Exercise:',
            taskText: 'WORK',
            stateDuration: state.workout.exerciseDuration.inSeconds,
            exercises: exercises,
            controller: controller,
            roundIndex: roundIndex,
          );
          return _buildPage(pageParams);
        } else if (state is SkipExerciseBufferState) {
          print(state);
          final Function onComplete = () {
            BlocProvider.of<WorkoutBloc>(context)
                .add(StartExerciseWorkoutEvent(state.workout));
            controller.restart(
              duration: state.workout.exerciseDuration.inSeconds,
            );
          };
          final pageParams = Params(
            context: context,
            workout: state.workout,
            onComplete: onComplete,
            exerciseText: 'Next Exercise:',
            taskText: 'GET READY',
            stateDuration: 10,
            exercises: exercises,
            controller: controller,
            roundIndex: roundIndex,
          );
          return _buildPage(pageParams);
        } else {
          return PageAnimationWidget(
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xff424242),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ),
          );
        }
      }),
    );
  }
}

class Params {
  final BuildContext context;
  final Workout workout;
  final Function onComplete;
  final String exerciseText;
  final String taskText;
  final int stateDuration;
  final int bufferDuration;
  final List<Exercise> exercises;
  final CountDownController controller;
  final int roundIndex;

  Params({
    @required this.context,
    @required this.workout,
    @required this.onComplete,
    @required this.exerciseText,
    @required this.taskText,
    @required this.stateDuration,
    this.bufferDuration = 10,
    @required this.exercises,
    @required this.controller,
    @required this.roundIndex,
  });
}

Widget _buildPage(
  final Params pageParams,
) {
  return PageAnimationWidget(
    body: Container(
      width: MediaQuery.of(pageParams.context).size.width,
      color: Color(0xff424242),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Table(
                  columnWidths: {0: FlexColumnWidth(0.5)},
                  children: [
                    TableRow(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            pageParams.exerciseText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xfffbc02d),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: FittedBox(
                            child: InkWell(
                              child: Text(
                                ('${pageParams.exercises.last.title}'),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                CustomOverlay(
                                  context: pageParams.context,
                                  overlayWidget: Container(
                                    height: MediaQuery.of(pageParams.context)
                                            .size
                                            .height *
                                        0.3,
                                    child:
                                        (pageParams.exercises.last.asset != '')
                                            ? Image.asset(
                                                pageParams.exercises.last.asset)
                                            : Image.asset(
                                                'assets/gifs/no_content.gif'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Round: ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xfffbc02d),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${pageParams.roundIndex}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pageParams.taskText,
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleTimer(
                  duration: pageParams.stateDuration,
                  onComplete: pageParams.onComplete,
                  controller: pageParams.controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // restart button
                    IconButton(
                      onPressed: pageParams.controller.restart,
                      icon: Icon(
                        Icons.replay_rounded,
                        color: Colors.purple,
                      ),
                      iconSize: 75.0,
                    ),
                    // skip exercise button
                    IconButton(
                      onPressed: () {
                        pageParams.exercises.removeLast();
                        if (pageParams.exercises.isEmpty) {
                          BlocProvider.of<WorkoutBloc>(pageParams.context)
                              .add(NewRoundEvent(pageParams.workout));
                        } else {
                          BlocProvider.of<WorkoutBloc>(pageParams.context)
                              .add(SkipWorkoutEvent(pageParams.workout));
                          pageParams.controller.restart(
                            duration: pageParams.bufferDuration,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.skip_next_rounded,
                        color: Colors.purple,
                      ),
                      iconSize: 75.0,
                    ),
                  ],
                ),
              ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormattedButton(
                      onPressed: () {
                        BlocProvider.of<WorkoutBloc>(pageParams.context)
                            .add(FinishWorkoutEvent(pageParams.workout));
                      },
                      buttonText: 'Finish Workout',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
