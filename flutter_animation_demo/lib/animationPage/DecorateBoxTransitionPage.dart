
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecorateBoxTranistionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DecorateBoxLayout();
  }

}

class DecorateBoxLayout extends State with SingleTickerProviderStateMixin{
  Animation<Decoration> animation;
  AnimationController animationController;
  Animation _curve;

  var child;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);
    animation = DecorationTween(
        begin: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            color: Colors.yellow
        ),
        end: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.blue
        ),
    ) .animate(animationController);

    animation.addStatusListener((status) {
      print("$status"); // 打印状态
      if (status == AnimationStatus.completed) {
        animationController.reverse(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward(); // 重新从头到尾播放
      }
    });

    //开始动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Center(
          child: Text("DecorateBoxTranistion"),
        ),
      ),
      body: Center(
        child:DecoratedBoxTransition(
          position: DecorationPosition.background,
          decoration: animation,
          child: Container(
            height: 100,
            width: 100,
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}