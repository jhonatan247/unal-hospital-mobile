import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final int lines;

  TextArea({this.label, this.hint, this.lines});

  InputDecoration buildDecorator( String hint, BuildContext context ) {
    return JhontanMariaTheme.getTextAreaDecoration(hint);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: lines,
      decoration: JhontanMariaTheme.getTextAreaDecoration(hint),
      style: TextStyle(),
    );
  }
}