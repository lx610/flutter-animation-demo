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

  var click = false;

  var itemclick= false;

  AnimatedContainerState(String titleString){
    titleText = titleString;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Center(child: Text(titleText),),
     ),
     body: Column(
       children: <Widget>[
         Container(
             child:Center(
               child:GestureDetector(
                 onTap: () {
                   setState(() {
                     click = !click;
                   });
                 },
                 child: AnimatedContainer(
                   height: click ? 200 : 100,
                   width: click ? 200 : 100,
                   color: Colors.blue,
                   duration: Duration(seconds: 1),
                   child: Center(
                     child: Text("点我"),
                   ),
                 ),
               ),
             )
         ),
         Container(
           child: Center(
             child:GestureDetector(
               onTap: () {
                 setState(() {
                   itemclick = !itemclick;
                 });
               },
    child:AnimatedContainer(
      height: itemclick ? 200 : 100,
      width: itemclick ? 200 : 100,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(
            itemclick ? 200 : 0,
          ))),
      duration: Duration(seconds: 1),
      curve: Curves.linear,
      onEnd: (){
        setState(() {
          itemclick = !itemclick;
        });
      },
    ) ,
    )
           ),
         )
       ],
     )
   );
  }

}