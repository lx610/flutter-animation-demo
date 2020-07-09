
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteranimationdemo/base/BasePageWidgt.dart';

class RotationTransitionPage extends BasePageWidgt{
  RotationTransitionPage(String title) : super(title);

  @override
  State<StatefulWidget> createState() {
    return RotationTransitionLayout(title);
  }

}

class RotationTransitionLayout extends BaseLayout with SingleTickerProviderStateMixin{
  RotationTransitionLayout(String titleString) : super(titleString);

  //动画控制器
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值，
    // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 2 为2秒，当然也可以设置毫秒 milliseconds：2000.
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法

        //重置起点
        controller.reset();

        print("status is completed");
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
  }

  @override
  getLayout() {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed:()=>{
            controller.forward()
          },
          child: Text("click"),
        ),
        RotationTransition(
          //设置动画的旋转中心
          alignment: Alignment.center,
          //动画控制器
          turns: controller,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}