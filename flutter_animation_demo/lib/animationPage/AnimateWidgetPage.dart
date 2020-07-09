
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyAnimateWidgtPage.dart';
import 'animateWidget/AnimatedLogo.dart';

class AnimateWidgetPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return AimateWidgeLayout();
  }
}

class AimateWidgeLayout extends State with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
        duration: const Duration(milliseconds: 2000));
    animation = new Tween(begin: 0.0,end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AimateWidge"),
        ),
      ),
      body: new AnimatedLogo(animation: animation),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}