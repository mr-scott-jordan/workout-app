import 'package:flutter/material.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/model/workout.dart';
import 'package:workout_app/pages/primary_drawer.dart';
import 'package:workout_app/widgets/formatted_button.dart';

import '../pages/workout_setup_page.dart';

// ignore: must_be_immutable
class EquipmentPage extends StatefulWidget {
  static const routeName = 'equipment-page';
  Workout workout;

  EquipmentPage(this.workout);

  @override
  _EquipmentPageState createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _pullupBar = false;
    _yogaMat = false;
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

  bool _pullupBar;
  bool _yogaMat;

  // @override
  // void initState() {
  //   _pullupBar = false;
  //   _yogaMat = false;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            //Works as the drawer (first widget)
            Scaffold(
              backgroundColor: const Color(0xff424242),
              body: PrimaryDrawer(),
            ),
            //works as main screen (widget on the top)
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(35),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue[400], Colors.purple])),
                    // color: const Color(0xffee5253),
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
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pullup Bar'),
                        Switch(
                            value: _pullupBar,
                            onChanged: (value) {
                              setState(() {
                                _pullupBar = value;
                                _pullupBar
                                    ? widget.workout.equipment
                                        .add(Equipment.PullUpBar)
                                    : widget.workout.equipment
                                        .remove(Equipment.PullUpBar);
                                // print(widget.workout.equipment[0].toString());
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Yoga Mat'),
                        Switch(
                            value: _yogaMat,
                            onChanged: (value) {
                              setState(() {
                                _yogaMat = value;
                                _yogaMat
                                    ? widget.workout.equipment
                                        .add(Equipment.YogaMat)
                                    : widget.workout.equipment
                                        .remove(Equipment.YogaMat);
                              });
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
                            WorkoutSetupPage.routeName,
                          );
                        },
                        buttonText: "Next",
                      ),
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
