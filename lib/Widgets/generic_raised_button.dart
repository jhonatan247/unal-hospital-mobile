import 'package:flutter/material.dart';
import 'package:me_cuido/Theme/Theme.dart';

class GenericRaisedButton extends StatelessWidget {
  final Function onPressed;
  final bool solid;
  final bool enabled;
  final IconData sufixIcon;
  final IconData prefixIcon;
  final String content;

  GenericRaisedButton(
    this.content,
    this.onPressed, {
    this.enabled = true,
    this.sufixIcon,
    this.prefixIcon,
    this.solid = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonContent = [];
    final iconColor =
        JhontanMariaTheme.getGenericRaisedButtonTextColor(solid, enabled);
    if (prefixIcon != null)
      buttonContent.add(Icon(
        prefixIcon,
        color: iconColor,
      ));
    buttonContent.add(RichText(
      text: TextSpan(
        text: content,
        style:
            JhontanMariaTheme.getGenericRaisedButtonTextStyle(solid, enabled),
      ),
    ));
    if (sufixIcon != null)
      buttonContent.add(Icon(
        sufixIcon,
        color: iconColor,
      ));

    return RaisedButton(
      onPressed: enabled ? onPressed : null,
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
