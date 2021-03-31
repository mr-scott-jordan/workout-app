import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';
import 'list_of_workouts_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final String userId = firebaseUser.uid;
    return BlocConsumer<WorkoutBloc, WorkoutState>(
      listener: (context, state) {
        if (state is ChooseWorkoutFromListState) {
          Navigator.pushReplacementNamed(context, ListOfWorkoutsPage.routeName);
        } else if (state is! WorkoutLoadedState ||
            state is! ChooseWorkoutFromListState) {
          BlocProvider.of<WorkoutBloc>(context)
              .add(ResetWorkoutEvent(state.getWorkout()));
        }
      },
      builder: (context, state) {
        if (state is WorkoutLoadedState) {
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Icon(
                      Icons.fitness_center_rounded,
                      size: 150,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: FormattedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, EquipmentPage.routeName);
                      },
                      buttonText: "New Workout",
                    ),
                  ),
                  Center(
                    child: FormattedButton(
                      onPressed: () {
                        BlocProvider.of<WorkoutBloc>(context).add(
                          GetWorkoutsEvent(
                            workout: state.workout,
                            userId: userId,
                          ),
                        );
                      },
                      buttonText: "Load saved workouts",
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return PageAnimationWidget(
            body: Center(
              child: Text(' '),
            ),
          );
        }
      },
    );
  }
}
