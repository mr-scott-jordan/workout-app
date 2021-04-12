import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../domain/entities/workout.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';
import 'list_of_workouts_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (BuildContext context, state) {
        if (state is UserUnauthenticatedState) {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }
      },
      child: BlocConsumer<WorkoutBloc, WorkoutState>(
        listener: (context, state) {
          if (state is ChooseWorkoutFromListState) {
            Navigator.pushReplacementNamed(
                context, ListOfWorkoutsPage.routeName);
          } else if (state is! WorkoutLoadedState) {
            BlocProvider.of<WorkoutBloc>(context)
                .add(ResetWorkoutEvent(state.getWorkout()));
          }
        },
        builder: (context, state) {
          if (state is WorkoutLoadedState) {
            var center = Center(
                child: _loadSavedWorkoutsButton(
              state.getWorkout(),
            ));
            return PageAnimationWidget(
              body: Container(
                color: Color(0xff424242),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child:
                                Image.asset('assets/images/love_hate_logo.png'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 2.0,
                            width: double.infinity,
                            color: Colors.purple,
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
                          center,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return PageAnimationWidget(
              body: Container(
                color: Color(0xff424242),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _loadSavedWorkoutsButton(Workout workout) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserAuthenticatedState) {
          return FormattedButton(
            onPressed: () {
              BlocProvider.of<WorkoutBloc>(context).add(
                GetWorkoutsEvent(
                  workout: workout,
                  // todo for nathan
                  userId: state.getUserID(),
                ),
              );
            },
            buttonText: "Load Saved Workout",
          );
        } else {
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
            ),
          );
          // return FormattedButton(
          //   onPressed: () {
          //     BlocProvider.of<WorkoutBloc>(context).add(
          //       GetWorkoutsEvent(
          //         workout: workout,
          //         // todo for nathan
          //         userId: context.watch<User>().uid,
          //       ),
          //     );
          //   },
          //   buttonText: "Load saved workouts",
          // );
        }
      },
    );
  }
}
