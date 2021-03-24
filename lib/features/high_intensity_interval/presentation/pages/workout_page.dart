import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import '../widgets/timer.dart';
import 'home_page.dart';
import 'workout_summary_page.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = '/workout-page';
  final CountDownController controller = CountDownController();
  var exercises;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutBloc, WorkoutState>(listener: (context, state) {
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
        BlocProvider.of<WorkoutBloc>(context)
            .add(StartRestWorkoutEvent(state.workout));
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
        return PageAnimationWidget(
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xff424242),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'REST',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Next Exercise:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xfffbc02d),
                          ),
                        ),
                        Text(
                          ('${exercises.last.title}'),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 2.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.purple,
                    ),
                  ],
                ),
                CircleTimer(
                  duration: state.workout.restDuration.inSeconds,
                  onComplete: onComplete,
                  controller: controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // currently broken
                    FormattedButton(
                      onPressed: () {
                        BlocProvider.of<WorkoutBloc>(context)
                            .add(FinishWorkoutEvent(state.workout));
                      },
                      buttonText: 'Finish Workout',
                    ),
                    //FormattedButton(), //TODO: skip button
                  ],
                )
              ],
            ),
          ),
        );
      } else if (state is ExerciseInProgressState) {
        print(state);
        final Function onComplete = () {
          exercises.removeLast();
          if (exercises.isEmpty) {
            // TODO: create workout finished page
            // after all exercises finish, breaks (navigator problem)
            BlocProvider.of<WorkoutBloc>(context)
                .add(FinishWorkoutEvent(state.workout));
          } else {
            BlocProvider.of<WorkoutBloc>(context)
                .add(StartRestWorkoutEvent(state.workout));
            controller.restart(
              duration: state.workout.restDuration.inSeconds,
            );
          }
        };
        return PageAnimationWidget(
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xff424242),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WORK',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Current Exercise:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xfffbc02d),
                          ),
                        ),
                        Text(
                          ('${exercises.last.title}'),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 2.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.purple,
                    ),
                  ],
                ),
                CircleTimer(
                  duration: state.workout.exerciseDuration.inSeconds,
                  onComplete: onComplete,
                  controller: controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // currently broken
                    FormattedButton(
                      onPressed: () {
                        BlocProvider.of<WorkoutBloc>(context)
                            .add(FinishWorkoutEvent(state.workout));
                      },
                      buttonText: 'Finish Workout',
                    ),
                    //FormattedButton(), //TODO: skip button
                  ],
                )
              ],
            ),
          ),
        );
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
    });
  }
}
