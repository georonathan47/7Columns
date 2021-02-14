import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Center(
            child: new SpinKitFadingCircle(
              color: Colors.amberAccent,
              size: 70.0,
            ),
          ),
        ],
      ),
    );
  }
}
