import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../../../services/save_workout_service.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'home_page.dart';
import 'login_page.dart';

class WorkoutSummaryPage extends StatelessWidget {
  static const routeName = '/workout-summary';
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
          if (state is WorkoutLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is WorkoutFinishedState) {
            return PageAnimationWidget(
              body: Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xff424242),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Congratulations! You finished your workout. Save your current workout parameters or go back to the Main Menu.',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xfffbc02d),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/stoked.gif'),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText:
                                      'To save your workout enter a name.'),
                              textAlign: TextAlign.center,
                              onSubmitted: (String workoutName) {
                                BlocProvider.of<WorkoutBloc>(context).add(
                                    EditWorkoutNameEvent(
                                        workout: state.workout,
                                        workoutName: workoutName));
                              },
                            ),
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
                          FormattedButton(
                            buttonText: 'Main Menu',
                            onPressed: () {
                              BlocProvider.of<WorkoutBloc>(context)
                                  .add(ResetWorkoutEvent(state.workout));
                            },
                          ),
                          FormattedButton(
                            buttonText: 'Save Workout',
                            onPressed: () {
                              var user =
                                  BlocProvider.of<UserBloc>(context).state;
                              SaveWorkoutService.saveWorkout(
                                (user as UserAuthenticatedState).getUserID(),
                                state.workout,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: FormattedButton(
                        buttonText: 'Finish',
                        onPressed: () {
                          BlocProvider.of<WorkoutBloc>(context)
                              .add(ResetWorkoutEvent(state.workout));
                        },
                      ),
                    ),
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
                  children: [
                    Text('oh no'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
