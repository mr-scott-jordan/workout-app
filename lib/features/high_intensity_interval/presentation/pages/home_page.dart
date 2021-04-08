import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/core/authentication/bloc/user_bloc.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/pages/login_page.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';

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
          if (state is! WorkoutLoadedState) {
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
                        child: Image.asset('assets/images/love_hate_logo.png')),
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
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Homepage'),
            );
          }
        },
      ),
    );
  }
}
