import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';

class ListOfWorkoutsPage extends StatelessWidget {
  static const routeName = '/list-of-workouts-page';
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final String userId = firebaseUser.uid;
    return BlocConsumer<WorkoutBloc, WorkoutState>(
      listener: (context, state) {
        // react to states here
      },
      builder: (context, state) {
        if (state is ChooseWorkoutListState) {
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
              child: Text(state.workouts.length.toString()),
            ),
          );
        } else {
          return Center(
            child: Text(
                'You need to investigate why WorkoutLoadedState is being streamed'),
          );
        }
      },
    );
  }
}
