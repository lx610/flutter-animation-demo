
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatePhysicalModelPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
      return AnimatePhysicalModelLayout();
  }

}

class AnimatePhysicalModelLayout extends State {

  bool _animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AnimatePhysicalModel"),
        ),
      ),
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('动画'),
              onPressed: () {
                setState(() {
                  _animated = !_animated;
                });
              },
            ),
            _buildAnimatedPhysicalModel(),
          ],
        ),
      ) ,
    );
  }

  _buildAnimatedPhysicalModel() {
    return AnimatedPhysicalModel(
      borderRadius: BorderRadius.circular(_animated ? 20 : 10),
      shape: BoxShape.rectangle,
      color: _animated ? Colors.blue : Colors.red,
      elevation: _animated ? 18 : 8,
      shadowColor: !_animated ? Colors.blue : Colors.red,
      child: Container(
        height: 100,
        width: 100,
      ),
      duration: Duration(seconds: 1),
    );
  }
}