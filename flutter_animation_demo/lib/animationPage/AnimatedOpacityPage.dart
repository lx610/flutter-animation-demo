
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AimateOpacityPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return AimateOpacityLayout();
  }

}

class AimateOpacityLayout extends State {
  //控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Aimateopacity"),
        ),
        body:new Center(
          //添加Opacity动画
          child: new AnimatedOpacity(
            //控制opacity值 范围从0.0到1.0
            opacity: _visible ? 1.0 : 0.0,
            //设置动画时长
            duration: new Duration(
                milliseconds: 1000
            ),
            child: new Container(
              width: 300.0,
              height: 300.0,
              color: Colors.deepPurple,
            ),
          ),
        ),
          floatingActionButton: new FloatingActionButton(
            onPressed: (){
              //控制动画显示状态
              setState(() {
                _visible = !_visible;
              });
            },
            tooltip: "显示隐藏",
            child: new Icon(Icons.flip),
          ),
      );
  }
}