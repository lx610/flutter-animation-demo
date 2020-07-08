import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnimateWidgtPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimateLayout();
  }

}

class AnimateLayout extends State with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {

    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // 区别在这里，不需要主动 addListener 中去 setState
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status) {
      print("$status"); // 打印状态
      if (status == AnimationStatus.completed) {
        controller.reverse(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(); // 重新从头到尾播放
      }
    });

    controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Center(
          child: Text("AnimateWidgt"),
        ),
      ),
      body: Center(
        child: AnimatedLogo(animation: animation),
      )
    );
  }

}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    // 外部传递过来的 Animation 对象
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}