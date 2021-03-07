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
        };
        return CircleTimer(
          duration: state.workout.restDuration.inSeconds,
          onComplete: onComplete,
        );
      } else if (state is ExerciseInProgressState) {
        print(state);
        final Function onComplete = () {
          BlocProvider.of<WorkoutBloc>(context)
              .add(EditWorkoutEvent(state.workout));
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
