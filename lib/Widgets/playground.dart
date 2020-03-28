import 'package:flutter/material.dart';


import './TextArea.dart';

class PlayGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextArea(hint: "Type something", lines: 3),
        TextArea(hint: "Type something", lines: 3),
      ],
    );
  }
}
