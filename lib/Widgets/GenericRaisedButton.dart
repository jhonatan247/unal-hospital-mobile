import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class GenericRaisedButton extends StatelessWidget {
  final Function onPressed;
  final bool solid;
  final bool nextArrow;
  final bool backArrow;
  final String content;

  GenericRaisedButton(
    this.content, {
    this.nextArrow,
    this.backArrow,
    this.onPressed,
    this.solid = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonContent = [];
    if (backArrow == true) buttonContent.add(Icon(Icons.keyboard_arrow_left));
    buttonContent.add(Text(content));
    if (nextArrow == true) buttonContent.add(Icon(Icons.keyboard_arrow_right));

    return RaisedButton(
      onPressed: onPressed,
      color: solid
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.background,
      disabledColor: Theme.of(context).colorScheme.primaryVariant,
      child: Row(
        children: buttonContent,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
