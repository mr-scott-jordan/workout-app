import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/model/workout.dart';
import 'package:workout_app/pages/primary_drawer.dart';
import 'package:workout_app/widgets/formatted_button.dart';

class WorkoutPage extends StatefulWidget {
  static const routeName = 'workout-page';
  final Workout workout;
  WorkoutPage(this.workout);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

// ignore: must_be_immutable
class _WorkoutPageState extends State<WorkoutPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    widget.workout.setWorkoutDuration();
    var minutes = widget.workout.totalDuration.inMinutes;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xff22a6b3),
              body: PrimaryDrawer(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(35),
                  child: Container(
                    color: const Color(0xffee5253),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => _toggleAnimation(),
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _animationController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(
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
                              widget.workout.exercises.elementAt(0).title,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decorationColor: Colors.amberAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Countdown(
                            duration: Duration(
                              minutes: minutes,
                            ),
                            onFinish: () {
                              print('finished!');
                            },
                            builder: (BuildContext ctx, Duration remaining) {
                              return Text(
                                minutes > 9
                                    ? '${remaining.toString().substring(2, 7)}'
                                    : '${remaining.toString().substring(2, 7)}',
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    FormattedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      buttonText: "Finish Workout",
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
