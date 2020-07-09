import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 abstract class BasePageWidgt extends StatefulWidget{
   String title;

   BasePageWidgt(this.title);

}

abstract class BaseLayout extends State {
   String titleString;

   BaseLayout(this.titleString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(titleString),
        ),
      ),
      body: getLayout(),
    );
  }

  getLayout();
}