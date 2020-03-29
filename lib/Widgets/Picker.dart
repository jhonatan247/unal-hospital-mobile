import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_cuido/Theme/Theme.dart';

class Picker extends StatelessWidget {
  final String hint;
  final String label;
  final Function validator;
  final Function onSaved;

  Picker(
    this.label,
    this.hint,
    this.validator,
    this.onSaved,
  );

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
            inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
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
