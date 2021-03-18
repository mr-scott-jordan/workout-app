import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'formatted_button.dart';

class CircleTimer extends StatelessWidget {
  final int duration;
  final Function onComplete;
  final CountDownController controller;
  CircleTimer({
    @required this.duration,
    @required this.onComplete,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    //CountDownController _controller = CountDownController();

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularCountDownTimer(
          duration: duration,
          initialDuration: 0,
          controller: controller,
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
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.HH_MM_SS,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            print('Countdown Started');
          },
          onComplete: onComplete,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // FormattedButton(
            //   onPressed: controller.start,
            //   buttonText: "Start",
            // ),
            FormattedButton(
              onPressed: controller.resume,
              buttonText: "Resume",
            ),
            FormattedButton(
              onPressed: controller.pause,
              buttonText: "Pause",
            ),
            FormattedButton(
              onPressed: controller.restart,
              buttonText: "Restart",
            ),
          ],
        ),
      ],
    );
  }
}
