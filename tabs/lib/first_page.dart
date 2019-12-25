import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(
          "your Bank balance is zero ",
          style: new TextStyle(
            fontSize: 25.0,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
