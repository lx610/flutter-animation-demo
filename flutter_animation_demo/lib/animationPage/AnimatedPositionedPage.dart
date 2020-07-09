

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPositionPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
      return AnimatedPositionLayout();
  }

}

class AnimatedPositionLayout extends State {

  var _top = 30.0;
  var _left = 30.0;
  var _curve = Curves.easeOutQuart;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("AnimatedPostion"),
          ),
        ),
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[

            Container(height: 250, width: 200, color: Colors.yellow),
            AnimatedPositioned(
              curve: _curve,
              top: _top,
              left: _left,
              width: 30,
              duration: Duration(seconds: 2),
              child: Container(height: 50, width: 50, color: Colors.red),
            ),
            RaisedButton(
              onPressed: ()=>{
                setState(() {
                  if(_top == 30){
                    _top = 180;
                    _left = 100;
                    _curve= Curves.easeOutQuart;
                  }else{
                    _top = 30;
                    _left = 30;
                    _curve= Curves.easeOutQuart;
                  }
                })
              },
              child: Text("click"),
            ),
          ],
        ),
      );
  }

  
}