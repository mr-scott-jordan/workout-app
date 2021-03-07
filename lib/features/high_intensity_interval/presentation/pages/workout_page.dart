import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';
import '../widgets/timer.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = 'workout-page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      // state is WorkoutLoadedState
      // add new event StartRestWorkoutEvent
      // state is RestInProgressState
      // pass rest duration parameters to
      // state is ExerciseInProgressState

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
          // SCOTT: opening the same page again works (with Navigator.pushNamed), but the animation isn't fluid (as you'll see)
          // but this means 2 things:
          // 1: onComplete is passing correctly and working
          // 2: the issue is with the page not "refreshing" when the state changes (so the timer doesn't change)
          // so I think it has something to do with the package being stateful. Is there a better way to refresh the page?
          Navigator.pushNamed(
            context,
            WorkoutPage.routeName,
          );
        };
        return CircleTimer(
          duration: state.workout.restDuration.inSeconds,
          onComplete: onComplete,
        );
      } else if (state is ExerciseInProgressState) {
        print(state);
        final Function onComplete = () {
          BlocProvider.of<WorkoutBloc>(context)
              .add(StartRestWorkoutEvent(state.workout));
          Navigator.pushNamed(
            context,
            WorkoutPage.routeName,
          );
        };
        return CircleTimer(
          duration: state.workout.exerciseDuration.inSeconds,
          onComplete: onComplete,
        );
      } else {
        return PageAnimationWidget(
          body: Text('An Error has occured'),
        );
      }
    });
  }
}
