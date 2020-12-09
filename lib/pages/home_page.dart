import 'package:flutter/material.dart';
import 'package:workout_app/pages/equipment_page.dart';
import 'package:workout_app/pages/primary_drawer.dart';

class HomeForm extends StatefulWidget {
  // const HomeForm({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
  // HomePage createState() => HomePage();
}

class HomePage extends State<HomeForm> with SingleTickerProviderStateMixin {
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
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Icon(Icons.fitness_center, size: 150),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: RaisedButton(
                        child: Text('Load Workout'),
                        onPressed: () {
                          Navigator.pushNamed(context, EquipmentPage.routeName);
                        },
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
