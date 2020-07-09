import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedContainerpage.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedCrossFadepage.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedDefaultTextStylepage.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedListStatePage.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedPositionedPage.dart';
import 'package:flutteranimationdemo/animationPage/DecorateBoxTransitionPage.dart';
import 'package:flutteranimationdemo/animationPage/MyAnimateWidgtPage.dart';
import 'package:flutteranimationdemo/animationPage/PositionTransitionPage.dart';

import 'animationPage/AnimateWidgetPage.dart';
import 'animationPage/AnimatedModalBarrierPage.dart';
import 'animationPage/AnimatedOpacityPage.dart';
import 'animationPage/AnimatedPhysicalModelPage.dart';
import 'animationPage/AnimatedSizePage.dart';
import 'animationPage/HeroPage.dart';
import 'animationPage/RotationTransitionPage.dart';
import 'animationPage/SizeTransitionPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationNameListPage(),
    );
  }
}

class AnimationNameListPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return animationList();
  }

}

class animationList extends State{


  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> itemNameList;
  @override
  Widget build(BuildContext context) {

   itemNameList = getListData();

    return Scaffold(
      body:
      Container(
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child:     Container(
              margin: EdgeInsets.fromLTRB(50, 30, 0, 30),
              child: GestureDetector(
                onTap: ()=>jumpToPage(context,"Hero"),
                child: Row(
                  children: <Widget>[
                    Text("hero"),
                    Hero(
                      tag: "hero",
                      child: Icon(Icons.timer,size: 45,),
                      flightShuttleBuilder: (flightContext, animation, direction,
                          fromContext, toContext) {
                        return Icon(Icons.timer, size: 45.0,);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ,
          Expanded(
            flex: 3,
            child:  AnimatedList(
              key: _listKey,
              initialItemCount: itemNameList.length,
              itemBuilder: (BuildContext context, int index, Animation animation) {
                return getListItem(context,index, animation);
              },
            ) ,
          ),

        ],)
      )
    );
  }

  List<String> getListData() => ["AnimatedContainer","AnimatedCrossFade","AnimatedWidget",
    "AnimatedBuilder","AnimatedBuilder","DecoratedBoxTransition","FadeTransition",
    "PositionedTransition","RotationTransition","ScaleTransition","SizeTransition","SlideTransition",
    "AnimatedDefaultTextStyle","AnimatedModalBarrier","AnimatedOpacity","AnimatedPhysicalModel","AnimatedPositioned",
    "AnimatedSize","AnimatedWidget","AnimatedWidgetBaseState","AnimatedListState"
  ];

  getListItem(BuildContext context, int index, Animation<dynamic> animation) {

    return Card(
        child: new Dismissible(
          key: new Key(itemNameList[index]),
          onDismissed: (direction) {
            String text = itemNameList[index];
            itemNameList.removeAt(index);
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("$text has delete")));
          },
          // Show a red background as the item is swiped away
          background: new Container(color: Colors.red),
          child:ListTile(
            onTap: ()=>jumpToPage(context,itemNameList[index]),//()=> 符号表示传递的是回调函数，不使用的话表示直接执行这个函数
            title: Text(
              itemNameList[index],
            ),
          ),
        ),
    );
  }

  jumpToPage(BuildContext context,String itemNameList) {
   switch(itemNameList){
     case "AnimatedContainer":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedContainerPage()));
       });
       break;
     case "AnimatedCrossFade":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedCrossFadepage()));
       });
       break;
     case "Hero":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new HoroPage()));
       });
       break;
     case "AnimatedWidget":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new MyAnimateWidgtPage()));
       });
       break;
     case "DecoratedBoxTransition":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new DecorateBoxTranistionPage()));
       });
       break;
     case "PositionedTransition":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new PositionTranistionPage()));
       });
       break;

     case "SizeTransition":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new SizeTransitionPage("SizeTransition")));
       });
       break;

     case "RotationTransition":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new RotationTransitionPage("RotationTransition")));
       });
       break;

     case "AnimatedListState":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedListStatePage()));
       });
       break;

     case "AnimatedDefaultTextStyle":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimateDefaultTextStylePage()));
       });
       break;

     case "AnimatedModalBarrier":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedModalBarrierPage("AnimatedModalBarrier")));
       });
       break;

     case "AnimatedOpacity":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AimateOpacityPage()));
       });
       break;
     case "AnimatedPhysicalModel":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatePhysicalModelPage()));
       });
       break;

     case "AnimatedPositioned":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedPositionPage()));
       });
       break;

     case "AnimatedSize":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimatedSizePage("AnimatedSize")));
       });
       break;

     case "AnimatedWidgetBaseState":
       Future.delayed(Duration.zero, () {
         Navigator.push(context,    MaterialPageRoute(
             builder: (context) => new AnimateWidgetPage()));
       });
       break;
   }

  }


  Future<void> refresh() async{
    itemNameList = await getListData();
    setState(() {
    });
  }
}


