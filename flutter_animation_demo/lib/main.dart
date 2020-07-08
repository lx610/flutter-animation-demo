import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedContainerpage.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedCrossFadepage.dart';

import 'animationPage/HeroPage.dart';

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
                onTap: ()=>jumpToPage(context,itemNameList[2]),
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
            flex: 1,
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
    "AnimatedBuilder","AnimatedBuilder","DecoratedBoxTransition"];

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
   }

  }


  Future<void> refresh() async{
    itemNameList = await getListData();
    setState(() {
    });
  }
}


