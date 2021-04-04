import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'primary_drawer.dart';

class PageAnimationWidget extends StatefulWidget {
  final Widget body;

  PageAnimationWidget({@required this.body});
  @override
  _PageAnimationWidgetState createState() => _PageAnimationWidgetState();
}

class _PageAnimationWidgetState extends State<PageAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    final height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(children: [
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
                preferredSize: Size(double.infinity, height * 0.09),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue[400], Colors.purple],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
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
              body: widget.body,
            ),
          )
        ]);
      },
    );
  }
}
