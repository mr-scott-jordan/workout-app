import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/core/authentication/bloc/user_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';

class ListOfWorkoutsPage extends StatelessWidget {
  static const routeName = '/list-of-workouts-page';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUnauthenticatedState) {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      child: BlocConsumer<WorkoutBloc, WorkoutState>(
        listener: (context, state) {
          // react to states here
        },
        builder: (context, state) {
          if (state is ChooseWorkoutFromListState) {
            return PageAnimationWidget(
              body: Column(
                children: [
                  Container(
                    color: Color(0xff424242),
                    child: Text(state.workouts[0].exercises.toString()),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('List Of Workouts Page'),
            );
          }
        },
      ),
    );
  }
}
