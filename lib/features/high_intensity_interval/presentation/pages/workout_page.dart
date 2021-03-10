import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'home_page.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = '/workout-page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      if (state is WorkoutLoadedState) {
        return PageAnimationWidget(
          body: Container(
            color: Color(0xff424242),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Placeholder(
                    fallbackHeight: 250,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'WIP',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decorationColor: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      alignment: Alignment.centerRight,
                      // child: Countdown(
                      //   duration: Duration(
                      //     minutes: minutes,
                      //   ),
                      //   onFinish: () {
                      //     print('finished!');
                      //   },
                      //   builder: (BuildContext ctx, Duration remaining) {
                      //     return Text(
                      //       minutes > 9
                      //           ? '${remaining.toString().substring(2, 7)}'
                      //           : '${remaining.toString().substring(2, 7)}',
                      //       style: TextStyle(
                      //         color: Colors.amberAccent,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w900,
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                FormattedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                  buttonText: "Finish Workout",
                ),
              ],
            ),
          ),
        );
      } else {
        return PageAnimationWidget(
          body: Text('An Error has occured'),
        );
      }
    });
  }
}
