import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../exercise_data.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'workout_page.dart';

// ignore: must_be_immutable
class BulletinBoardPage extends StatelessWidget {
  static const routeName = '/bulletin-board-page';

  @override
  Widget build(BuildContext context) {
    var potentialExercises =
        List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
    potentialExercises.shuffle();

    return BlocConsumer<WorkoutBloc, WorkoutState>(listener: (context, state) {
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
                        Text(
                          (state.workout.totalDuration
                              .toString()
                              .split('.')[0]),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 2.0,
                          width: double.infinity,
                          color: Colors.purple,
                        ),
                      ],
                    )),
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
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // leading: Text(
                        //   workout.exercises[index].title,
                        //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        // ),
                        title: Text(
                          state.workout.exercises[index].title,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
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
                                    exercises[index] =
                                        potentialExercises.firstWhere((value) =>
                                            value !=
                                            state.workout.exercises[index]);
                                    BlocProvider.of<WorkoutBloc>(context).add(
                                        EditWorkoutEvent(state
                                            .copyWith(exercises: exercises)
                                            .workout));
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    var exercises =
                                        state.workout.exercises.sublist(0);
                                    exercises.removeAt(index);
                                    var numOfExercises =
                                        state.workout.numOfExercises - 1;

                                    BlocProvider.of<WorkoutBloc>(context)
                                        .add(EditWorkoutEvent(state
                                            .copyWith(
                                              numOfExercises: numOfExercises,
                                              exercises: exercises,
                                            )
                                            .workout));
                                  }),
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
    });
  }
}
