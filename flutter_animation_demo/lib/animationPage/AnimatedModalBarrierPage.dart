import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteranimationdemo/base/BasePageWidgt.dart';

class AnimatedModalBarrierPage extends BasePageWidgt {
  AnimatedModalBarrierPage(String title) : super(title);

  @override
  State<StatefulWidget> createState() {
    return AnimatedModalBarrierLayout(title);
  }
}

class AnimatedModalBarrierLayout extends BaseLayout with SingleTickerProviderStateMixin{
  var isDismiss = false;

  AnimatedModalBarrierLayout(String titleString) : super(titleString);

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController);

    _animation.addStatusListener((status) {
      print("$status"); // 打印状态
      if (status == AnimationStatus.completed) {
        _animationController.reverse(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward(); // 重新从头到尾播放
      }
    });

    //开始动画
    _animationController.forward();
  }

  @override
  getLayout() {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("click me"),
          onPressed: ()=>{
            isDismiss = !isDismiss
        },
        ),
        Center(
          child: Container(
            height: 100,
            width: 100,
            child: AnimatedModalBarrier(
              color: _animation,
              dismissible: isDismiss,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
