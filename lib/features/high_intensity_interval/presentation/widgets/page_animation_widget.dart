import 'package:flutter/material.dart';
import 'package:workout_app/features/high-intensity-interval/presentation/pages/primary_drawer.dart';

class PageAnimationWidget extends StatefulWidget {
  final Widget child;
  PageAnimationWidget({@required this.child});

  @override
  _PageAnimationWidgetState createState() => _PageAnimationWidgetState();
}

class _PageAnimationWidgetState extends State<PageAnimationWidget>
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
    // SystemChrome.setEnabledSystemUIOverlays([]);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xff424242),
              body: PrimaryDrawer(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(25),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue[400], Colors.purple])),
                    // color: const Color(0xff212121),
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
                body: widget.child,
              ),
            ),
          ],
        );
      },
    );
  }
}
