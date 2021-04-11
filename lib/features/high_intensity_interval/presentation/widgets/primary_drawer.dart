import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../domain/entities/workout.dart';
import '../bloc/workout_bloc.dart';
import '../pages/equipment_page.dart';
import 'formatted_button.dart';

class PrimaryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      // color: Color(0xFF37474F),
      color: Color(0xff212121),
      child: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          FormattedButton(
            onPressed: () {
              final Workout workout =
                  BlocProvider.of<WorkoutBloc>(context).state.getWorkout();
              BlocProvider.of<WorkoutBloc>(context).add(
                ResetWorkoutEvent(workout),
              );
              Navigator.pushReplacementNamed(context, '/');
            },
            buttonText: "Main Menu",
          ),
          SizedBox(
            height: 50,
          ),
          FormattedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, EquipmentPage.routeName);
            },
            buttonText: "New Workout",
          ),
          SizedBox(
            height: 50,
          ),
          FormattedButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(
                SignOutEvent(),
              );
            },
            buttonText: "Logout",
          ),
        ],
      ),
    ));
  }
}

// child: Center(
//           // child: Text('Primary Drawer'),
//           child: RaisedButton(
//               child: Text('Main Menu'),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/');
//               })),
