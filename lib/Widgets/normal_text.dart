import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String content;
  final TextAlign align;

  NormalText(
    this.content, {
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        content,
        textAlign: align,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
