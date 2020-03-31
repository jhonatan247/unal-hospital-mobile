import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class EnchancedText extends StatelessWidget {
  final String hint;
  final String label;
  final int maxLines;
  final IconData iconId;
  final Function validator;
  final Function onSaved;

  EnchancedText(
    this.label,
    this.hint, {
    this.iconId,
    this.onSaved,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    var decoration = JhontanMariaTheme.getTextAreaDecoration(hint);

    if (iconId != null) {
      decoration =
          JhontanMariaTheme.getMaterialIconTextFieldDecoration(hint, iconId);
    }

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
            decoration: decoration,
            maxLines: maxLines,
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
