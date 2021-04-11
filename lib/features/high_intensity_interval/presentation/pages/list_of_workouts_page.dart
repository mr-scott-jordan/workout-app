import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';
import 'login_page.dart';

class ListOfWorkoutsPage extends StatelessWidget {
  static const routeName = '/list-of-workouts-page';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUnauthenticatedState) {
          Navigator.pushReplacementNamed(
            context,
            LoginPage.routeName,
          );
        }
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is ChooseWorkoutFromListState) {
            return PageAnimationWidget(
              body: Container(
                width: double.infinity,
                color: Color(0xff424242),
                child: Column(
                  children: [
                    Container(
                      color: Color(0xff424242),
                      child: Text(
                        state.workouts.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WorkoutLoadedState) {
            return PageAnimationWidget(
              body: Container(
                width: double.infinity,
                color: Color(0xff424242),
              ),
            );
          } else {
            return PageAnimationWidget(
              body: Container(
                width: double.infinity,
                color: Color(0xff424242),
                child: Center(
                  child: Text('List Of Workouts Page'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
