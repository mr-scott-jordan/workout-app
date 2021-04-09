import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/core/authentication/bloc/user_bloc.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/pages/login_page.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'home_page.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Congratulations!  You finished your workout!'),
                    Container(
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
                  children: [],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
