import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay/overlay.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../data/assets/print_duration_asset.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'login_page.dart';
import 'workout_page.dart';

class BulletinBoardPage extends StatelessWidget {
  static const routeName = '/bulletin-board-page';

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
          print(state.workout.exercises);
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Workout Duration:',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xfffbc02d),
                              ),
                            ),
                            Text(
                              ('${printDuration(state.workout.totalDuration)}'),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 2.0,
                          width: double.infinity,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: ReorderableListView.builder(
                      onReorder: (int oldIndex, int newIndex) {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        var exercises = state.workout.exercises.sublist(0);
                        var item = exercises.removeAt(oldIndex);
                        exercises.insert(newIndex, item);
                        BlocProvider.of<WorkoutBloc>(context)
                            .add(EditWorkoutEvent(state
                                .copyWith(
                                  exercises: exercises,
                                )
                                .workout));
                      },
                      itemCount: state.workout.exercises.length,
                      itemBuilder: (context, index) {
                        final String exerciseName =
                            state.workout.exercises[index].title;
                        return ListTile(
                          key: ValueKey(exerciseName),
                          title: InkWell(
                            child: Text(
                              state.workout.exercises[index].title,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            CustomOverlay(
                              context: context,
                              overlayWidget: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: (state.workout.exercises[index].asset !=
                                        '')
                                    ? Image.asset(
                                        state.workout.exercises[index].asset)
                                    : Image.asset('assets/gifs/no_content.gif'),
                              ),
                            );
                          },
                          trailing: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.swap_calls_rounded),
                                    onPressed: () {
                                      var exercises =
                                          state.workout.exercises.sublist(0);
                                      print(exercises);
                                      state.workout.potentialExercises
                                          .shuffle();
                                      exercises[index] = state
                                          .workout.potentialExercises
                                          .firstWhere((value) => !state
                                              .workout.exercises
                                              .contains(value));
                                      BlocProvider.of<WorkoutBloc>(context).add(
                                          EditWorkoutEvent(state
                                              .copyWith(exercises: exercises)
                                              .workout));
                                    }),
                                Icon(Icons.reorder_rounded),
                              ],
                            ),
                          ),
                        );
                      },
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
                          onPressed: () {
                            BlocProvider.of<WorkoutBloc>(context).add(
                              GenerateWorkoutEvent(state.workout),
                            );
                          },
                          buttonText: "Regenerate Workout",
                        ),
                        FormattedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              WorkoutPage.routeName,
                            );
                          },
                          buttonText: "Begin Workout",
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
      }),
    );
  }
}
