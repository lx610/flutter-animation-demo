import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimateCrossFadeLayout();
  }

}

class AnimateCrossFadeLayout extends State {
  var click = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AniamtedCross"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  click = !click;
                });
              },
              child:Container(
                color: Colors.yellow,
                child:AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                  secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 300.0),
                  crossFadeState: click ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  layoutBuilder:  (topChild, topChildKey, bottomChild, bottomChildKey) {//解决两个动画大小不一样的时候，鬼畜的问题
                    return Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          key: topChildKey,
                          child: topChild,
                        ),
                        Positioned(
                          key: bottomChildKey,
                          top:0,
                          child: bottomChild,
                        ),
                      ],
                    );
                  },
                )  ,
              )
            ),
          )
        ],
      ),
    );
  }
}