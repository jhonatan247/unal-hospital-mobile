import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class TextIcon extends StatelessWidget {
  final String hint;
  final String label;
  final IconData iconId;

  TextIcon({this.label, this.hint, this.iconId});

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
            decoration: JhontanMariaTheme.getMaterialIconTextFieldDecoration(
                hint, iconId),
            style: Theme.of(context).textTheme.display1,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        ),
      ],
    );
  }
}
