import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteranimationdemo/base/BasePageWidgt.dart';

class AnimatedSizePage extends BasePageWidgt{
  AnimatedSizePage(String title) : super(title);

  @override
  State<StatefulWidget> createState() {
    return AnimatedSizeLayout(title);
  }

}

class AnimatedSizeLayout extends BaseLayout with SingleTickerProviderStateMixin{
  AnimatedSizeLayout(String titleString) : super(titleString);

  var _height = 100.0;
  var _width = 100.0;
  var _color = Colors.red;
  var containerColor = Colors.yellow;

  bool isClcik = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  getLayout() {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("click me"),
          onPressed: () {
            setState(() {
              if(isClcik){
                _height = 100.0;
                _width = 100.0;
                _color = Colors.red;
                containerColor = Colors.yellow;
              }else{
                _height = 200.0;
                _width = 200.0;
                _color = Colors.blue;
                containerColor = Colors.green;
              }
              isClcik = !isClcik;
            });
          },
        ),

        AnimatedContainer(
           curve: Curves.linear,
            height: isClcik ? 200 : 100,
            width: isClcik ? 200 : 100,
            duration: Duration(seconds: 1),
            color: containerColor,
            child: Text("AnimatedContainer"),
          ),
        AnimatedSize(
          vsync: this,
          duration: Duration(seconds: 1),
          child: Container(
            height: _height,
            width: _width,
            color: _color,
            child: Text("AnimatedSize"),
          ),
        ),
      ],
    );
  }

}