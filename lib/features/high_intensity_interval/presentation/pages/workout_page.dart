import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';

class WorkoutPage extends StatelessWidget {
  static const routeName = 'workout-page';
  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      if (state is WorkoutLoadedState) {
        return PageAnimationWidget(
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xff424242),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircularCountDownTimer(
                  duration: state.workout.totalDuration.inSeconds,
                  initialDuration: 0,
                  controller: _controller,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  ringColor: Colors.grey[300],
                  ringGradient: null,
                  fillColor: Colors.purpleAccent[100],
                  fillGradient: null,
                  backgroundColor: Colors.purple[500],
                  backgroundGradient: null,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.HH_MM_SS,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: false,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormattedButton(
                      onPressed: _controller.start,
                      buttonText: "Start",
                    ),
                    FormattedButton(
                      onPressed: _controller.pause,
                      buttonText: "Pause",
                    ),
                    FormattedButton(
                      onPressed: _controller.resume,
                      buttonText: "Resume",
                    ),
                    FormattedButton(
                      onPressed: _controller.restart,
                      buttonText: "Restart",
                    ),
                  ],
                )
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
