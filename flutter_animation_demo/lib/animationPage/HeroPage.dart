import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HoreLayout();
  }

}

class HoreLayout extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("heor"),
        ),
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(150, 200, 0, 0),
          child: Hero(
            tag: "hero",
            child: Icon(Icons.timer,size: 150,),
            flightShuttleBuilder: (flightContext, animation, direction,
                fromContext, toContext) {
              return Icon(Icons.timer, size: 150.0,);
            },
          ),
      ),
    );
  }
}