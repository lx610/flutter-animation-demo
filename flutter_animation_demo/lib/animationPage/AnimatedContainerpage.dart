import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    String title = "";
    return AnimatedContainerState(title);
  }


}

class AnimatedContainerState extends State{
  String titleText;

  AnimatedContainerState(String titleString){
    titleText = titleString;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(titleText),
     ),
   );
  }

}