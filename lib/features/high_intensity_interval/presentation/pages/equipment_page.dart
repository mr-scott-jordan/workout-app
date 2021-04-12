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
      child:
          BlocConsumer<WorkoutBloc, WorkoutState>(listener: (context, state) {
        if (state is! WorkoutLoadedState) {
          BlocProvider.of<WorkoutBloc>(context)
              .add(ResetWorkoutEvent(state.getWorkout()));
        }
      }, builder: (context, state) {
        if (state is WorkoutLoadedState) {
          final bool _pullupBar =
              state.workout.equipment.contains(Equipment.PullUpBar);
          final bool _yogaMat =
              state.workout.equipment.contains(Equipment.YogaMat);
          final bool _plyoBox =
              state.workout.equipment.contains(Equipment.PlyometricBox);
          final bool _dumbbell =
              state.workout.equipment.contains(Equipment.Dumbbell);

          var equipment = state.workout.equipment;
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 125,
                    width: 300,
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Please select equipment.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255, 188, 2, 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Pullup Bar'),
                      Switch(
                          activeColor: Color(0xfffbc02d),
                          value: _pullupBar,
                          onChanged: (value) {
                            if (value) {
                              equipment.add(Equipment.PullUpBar);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            } else {
                              equipment.remove(Equipment.PullUpBar);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            }
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Yoga Mat'),
                      Switch(
                          activeColor: Color(0xfffbc02d),
                          value: _yogaMat,
                          onChanged: (value) {
                            if (value) {
                              equipment.add(Equipment.YogaMat);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            } else {
                              equipment.remove(Equipment.YogaMat);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            }
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Plyometric Box'),
                      Switch(
                          activeColor: Color(0xfffbc02d),
                          value: _plyoBox,
                          onChanged: (value) {
                            if (value) {
                              equipment.add(Equipment.PlyometricBox);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            } else {
                              equipment.remove(Equipment.PlyometricBox);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            }
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dumbbell'),
                      Switch(
                          activeColor: Color(0xfffbc02d),
                          value: _dumbbell,
                          onChanged: (value) {
                            if (value) {
                              equipment.add(Equipment.Dumbbell);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            } else {
                              equipment.remove(Equipment.Dumbbell);
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutEvent(state
                                      .copyWith(equipment: equipment)
                                      .workout));
                            }
                          }),
                    ],
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.bottomCenter,
                    child: FormattedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          // HomePage.routeName,
                          WorkoutSetupPage.routeName,
                        );
                      },
                      buttonText: "Next",
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
      }),
    );
  }
}
