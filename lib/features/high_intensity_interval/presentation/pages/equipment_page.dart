import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/equipment.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'workout_setup_page.dart';

// ignore: must_be_immutable
class EquipmentPage extends StatelessWidget {
  static const routeName = '/equipment-page';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      if (state is WorkoutLoadedState) {
        final bool _pullupBar =
            state.workout.equipment.contains(Equipment.PullUpBar);
        final bool _yogaMat =
            state.workout.equipment.contains(Equipment.YogaMat);

        var equipment = state.workout.equipment;
        return PageAnimationWidget(
          body: Container(
            color: Color(0xff424242),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
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
                Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.bottomCenter,
                  child: FormattedButton(
                    onPressed: () {
                      Navigator.pushNamed(
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
    });
  }
}
