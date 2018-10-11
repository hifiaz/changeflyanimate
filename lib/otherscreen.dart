import 'package:flutter/material.dart';

class OtherScreen extends StatefulWidget {
  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen>
    with SingleTickerProviderStateMixin {
  // Define every controller and animation
  AnimationController controller;
  Animation animationTop;
  Animation animationRight;
  Animation animationLeft;

  @override
  void initState() {
    super.initState();
    // this animation controller to set duration of playing animation
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // this controller to set slide transation from top to bottom
    animationTop = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(controller);
    // this controller to set slide transation from right to center
    animationRight = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(controller);
    // this controller to set slide transation from left to center
    animationLeft = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Another'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Set Position to Stack to make image over another image
            Stack(
              children: <Widget>[
                // this slide transation with component or item set on top
                SlideTransition(
                  position: animationTop,
                  child: Image.asset(
                    'images/changefly-cube-top.png',
                    width: 300.0,
                  ),
                ),
                SlideTransition(
                  position: animationRight,
                  child: Image.asset(
                    'images/changefly-cube-right.png',
                    width: 300.0,
                  ),
                ),
                SlideTransition(
                  position: animationLeft,
                  child: Image.asset(
                    'images/changefly-cube-left.png',
                    width: 300.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
