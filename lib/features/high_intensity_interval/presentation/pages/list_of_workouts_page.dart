import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/bloc/user_bloc.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/page_animation_widget.dart';
import 'bulletin_board_page.dart';
import 'login_page.dart';

class ListOfWorkoutsPage extends StatelessWidget {
  static const routeName = '/list-of-workouts-page';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUnauthenticatedState) {
          Navigator.pushReplacementNamed(
            context,
            LoginPage.routeName,
          );
        }
      },
      child: BlocConsumer<WorkoutBloc, WorkoutState>(
        listener: (context, state) {
          if (state is WorkoutLoadedState) {
            Navigator.pushReplacementNamed(
                context, BulletinBoardPage.routeName);
          }
        },
        builder: (context, state) {
          if (state is ChooseWorkoutFromListState) {
            return PageAnimationWidget(
              body: Container(
                color: Color(0xff424242),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Please select a saved workout.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xfffbc02d),
                                  ),
                                ),
                              ],
                            ),
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
                      flex: 9,
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          child: state.workouts.length > 0
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.workouts.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                        title: Text(
                                            state.workouts[index].workoutName),
                                        onTap: () {
                                          BlocProvider.of<WorkoutBloc>(context)
                                              .add(EditWorkoutEvent(
                                                  state.workouts[index]));
                                        });
                                  })
                              : Center(
                                  child: Text('No workouts saved.'),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WorkoutLoadedState) {
            return PageAnimationWidget(
              body: Container(
                width: double.infinity,
                color: Color(0xff424242),
              ),
            );
          } else {
            return PageAnimationWidget(
              body: Container(
                width: double.infinity,
                color: Color(0xff424242),
                child: Center(
                  child: Text('List Of Workouts Page'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
