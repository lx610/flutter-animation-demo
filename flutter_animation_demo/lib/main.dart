import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/animationPage/AnimatedContainerpage.dart';

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
      body: Container(
        child: AnimatedList(
        key: _listKey,
        initialItemCount: itemNameList.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return getListItem(context,index, animation);
        },
      ),
      )
    );
  }

  List<String> getListData() => ["AnimatedContainer","AnimatedCrossFade","Hero","AnimatedWidget",
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
            onTap: jumpToPage(context,itemNameList[index]),
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
   }

  }


  Future<void> refresh() async{
    itemNameList = await getListData();
    setState(() {
    });
  }
}


