
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionTranistionPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
      return PositionTranistionLayout();
  }


}

class PositionTranistionLayout extends State with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //反向执行
        //controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });

    // 这个动画的过程是
    // 子widget 距左边距离从 10.0 变化 到100.0
    // 子widget 距上边距离从 10.0 变化 到100.0
    // 子widget 距右边距离从 10.0 变化 到100.0
    // 子widget 距下边距离从 10.0 变化 到100.0
    // 四边同时变化 相同的距离 倍率，所以看出来是 中心缩小的动画
    RelativeRectTween rectTween = RelativeRectTween(
      //初始位置设置
      begin: const RelativeRect.fromLTRB(
        //子widget 距父布局 left 10.0
          50.0,
          50.0,
          50.0,
          50.0),
      //结束位置设置
      end: RelativeRect.fromLTRB(
        //子widget 距父布局 left 100.0
        50.0,
        50.0,
        50.0,
        400.0,
      ),
    );

    //关联 controller
    animation = rectTween.animate(animationController);


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("PositionTransitionpage"),
        ),
      ),
      body:  buildSlideTransition(),
    );
  }


//渐变动画
  Widget buildSlideTransition() {
    return Stack(
      children: <Widget>[
        //必须作为Stack的子widget
        PositionedTransition(
          rect: animation,
          child: Container(
            color: Colors.grey,
            child: Image.network(
              "http://img-arch.pconline.com.cn/images/upload/upc/tx/photoblog/1212/25/c2/16868537_16868537_1356402718187.jpg",
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FlatButton(
              onPressed: () {
                if (animationController.isDismissed) {
                  ///正向动画开始
                  animationController.forward();
                } else if (animationController.isCompleted) {
                  ///反向动画开始
                  animationController.reverse();
                } else {
                  //停止
                  animationController.dispose();
                  //重置动画
                  animationController.reset();
                }
              },
              child: Text("开始")),
        )
      ],
    );
  }

}
