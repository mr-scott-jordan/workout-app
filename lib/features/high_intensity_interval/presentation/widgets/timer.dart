import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'formatted_button.dart';
import 'page_animation_widget.dart';

class CircleTimer extends StatelessWidget {
  final int duration;
  final Function onComplete;
  CircleTimer({
    @required this.duration,
    @required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    CountDownController _controller = CountDownController();

    return PageAnimationWidget(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xff424242),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularCountDownTimer(
              duration: duration,
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
  }
}
