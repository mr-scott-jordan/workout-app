import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutBloc, WorkoutState>(
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
            child: Text(
                'You need to investigate why WorkoutLoadedState is being streamed'),
          );
        }
      },
    );
  }
}
