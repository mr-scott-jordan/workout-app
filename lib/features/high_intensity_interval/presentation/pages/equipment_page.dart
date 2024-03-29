import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../domain/enums/equipment.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'login_page.dart';
import 'workout_setup_page.dart';

// ignore: must_be_immutable
class EquipmentPage extends StatelessWidget {
  static const routeName = '/equipment-page';
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
            final bool _pullupBar =
                state.workout.equipment.contains(Equipment.PullUpBar);
            final bool _yogaMat =
                state.workout.equipment.contains(Equipment.YogaMat);
            final bool _plyoBox =
                state.workout.equipment.contains(Equipment.PlyometricBox);
            final bool _dumbbell =
                state.workout.equipment.contains(Equipment.Dumbbell);

            return PageAnimationWidget(
              body: Container(
                color: Color(0xff424242),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Please select your available equipment.',
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
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SwitchListTile(
                            activeColor: Color(0xfffbc02d),
                            title: Text('Pullup Bar'),
                            value: _pullupBar,
                            onChanged: (value) {
                              var equipment =
                                  state.workout.equipment.sublist(0);
                              value
                                  ? equipment.add(Equipment.PullUpBar)
                                  : equipment.remove(Equipment.PullUpBar);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            },
                          ),
                          SwitchListTile(
                            activeColor: Color(0xfffbc02d),
                            title: Text('Yoga Mat'),
                            value: _yogaMat,
                            onChanged: (value) {
                              var equipment =
                                  state.workout.equipment.sublist(0);
                              value
                                  ? equipment.add(Equipment.YogaMat)
                                  : equipment.remove(Equipment.YogaMat);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            },
                          ),
                          SwitchListTile(
                            activeColor: Color(0xfffbc02d),
                            title: Text('Plyometric Box'),
                            value: _plyoBox,
                            onChanged: (value) {
                              var equipment =
                                  state.workout.equipment.sublist(0);
                              value
                                  ? equipment.add(Equipment.PlyometricBox)
                                  : equipment.remove(Equipment.PlyometricBox);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            },
                          ),
                          SwitchListTile(
                            activeColor: Color(0xfffbc02d),
                            title: Text('Dumbbell'),
                            value: _dumbbell,
                            onChanged: (value) {
                              var equipment =
                                  state.workout.equipment.sublist(0);
                              value
                                  ? equipment.add(Equipment.Dumbbell)
                                  : equipment.remove(Equipment.Dumbbell);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 2.0,
                            width: double.infinity,
                            color: Colors.purple,
                          ),
                          FormattedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                // HomePage.routeName,
                                WorkoutSetupPage.routeName,
                              );
                            },
                            buttonText: "Next",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text('An error occured'),
              ),
            );
          }
        },
      ),
    );
  }
}
