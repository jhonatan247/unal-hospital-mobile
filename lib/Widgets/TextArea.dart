import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final int lines;

  TextArea({this.label, this.hint, this.lines});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(label, style: Theme.of(context).textTheme.display1),
          ),
          margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
        ),
        Container(
          child: TextField(
            maxLines: lines,
            decoration: JhontanMariaTheme.getTextAreaDecoration(hint),
            style: Theme.of(context).textTheme.display1,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        ),
      ],
    );
  }
}
