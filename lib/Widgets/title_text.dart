import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String content;
  final TextAlign align;

  TitleText(
    this.content, {
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        content,
        textAlign: align,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
