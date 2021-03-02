import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';

class AuthHomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
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
                        // Navigator.pushNamed(context, EquipmentPage.routeName);
                      },
                      buttonText: "Sign in with Google",
                    ),
                  ),
                  Center(
                    child: FormattedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, EquipmentPage.routeName);
                      },
                      buttonText: "Go Anonymous",
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