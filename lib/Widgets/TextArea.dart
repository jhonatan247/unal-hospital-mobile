import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final int lines;
  final Function validator;
  final Function onSaved;

  TextArea({
    this.label,
    this.hint,
    this.lines,
    this.validator,
    this.onSaved,
  });

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
          child: TextFormField(
            decoration: JhontanMariaTheme.getTextAreaDecoration(hint),
            maxLines: lines,
            onSaved: onSaved,
            style: Theme.of(context).textTheme.display1,
            validator: validator,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        ),
      ],
    );
  }
}
