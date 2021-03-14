import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';
import '../widgets/timer.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = '/workout-page';
  final CountDownController controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      if (state is WorkoutLoadedState) {
        print(state);
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
        return CircleTimer(
          duration: state.workout.restDuration.inSeconds,
          onComplete: onComplete,
          controller: controller,
        );
      } else if (state is ExerciseInProgressState) {
        print(state);
        final Function onComplete = () {
          BlocProvider.of<WorkoutBloc>(context)
              .add(StartRestWorkoutEvent(state.workout));
          controller.restart(
            duration: state.workout.restDuration.inSeconds,
          );
        };
        return CircleTimer(
          duration: state.workout.exerciseDuration.inSeconds,
          onComplete: onComplete,
          controller: controller,
        );
      } else {
        return PageAnimationWidget(
          body: Text('An Error has occured'),
        );
      }
    });
  }
}
