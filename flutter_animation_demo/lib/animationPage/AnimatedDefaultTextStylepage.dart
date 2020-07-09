
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimateDefaultTextStylePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimateDefaultTextLayout();
  }

}

class AnimateDefaultTextLayout extends State {

  TextStyle _style;
  @override
  void initState() {
    _style=TextStyle(color: Colors.blue, fontSize: 14);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200,),
        AnimatedDefaultTextStyle(
          style: _style,
          duration: Duration(seconds: 2),
          child: Text('老孟'),
        ),
        SizedBox(height: 100,),
        RaisedButton(
          onPressed: (){
            setState(() {
              _style = TextStyle(color: Colors.red, fontSize: 24);
            });
          },
        )
      ],
    );
  }
}