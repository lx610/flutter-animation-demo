
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteranimationdemo/base/BasePageWidgt.dart';

class SizeTransitionPage extends BasePageWidgt{
  SizeTransitionPage(String title) : super(title);

  @override
  State<StatefulWidget> createState() {
    return SizeTransitionLayout(title);
  }

}

class SizeTransitionLayout extends BaseLayout with SingleTickerProviderStateMixin{
  SizeTransitionLayout(String titleString) : super(titleString);

  AnimationController controller;
  var _isClcik = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller  =   AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  getLayout() {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("clicl me"),
          onPressed: ()=>{

            if(_isClcik){

              controller.reverse()
            }else{

              controller.forward()
            }

            ,_isClcik = !_isClcik

          },
        ),
        SizeTransition(
            axis: Axis.horizontal, //控制宽度或者高度缩放
            sizeFactor:
            new Tween(begin: 1.0, end: 0.5).animate(controller),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red,
              child: Text('12345678'),
            )
        )
      ],

    );
  }

}