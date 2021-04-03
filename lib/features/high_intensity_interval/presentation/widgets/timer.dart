import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularCountDownTimer(
          duration: duration,
          initialDuration: 0,
          controller: controller,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
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
            //TODO: maybe create a pause/play button that reacts to state
            IconButton(
              onPressed: controller.pause,
              icon: Icon(
                Icons.pause_circle_outline_rounded,
                color: Colors.purple,
              ),
              iconSize: 100.0,
            ),
            IconButton(
              onPressed: controller.resume,
              icon: Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.purple,
              ),
              iconSize: 100.0,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: controller.restart,
              icon: Icon(
                Icons.replay_rounded,
                color: Colors.purple,
              ),
              iconSize: 75.0,
            ),
          ],
        )
      ],
    );
  }
}
