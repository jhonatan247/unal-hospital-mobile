import 'package:flutter/material.dart';
import './color/colorScheme.dart';

class JhontanMariaTheme {
  const JhontanMariaTheme();
  static ThemeData jonthanMariaTheme = ThemeData(
    primarySwatch: DeepBlueColorScheme.primarySwatch,
    backgroundColor: DeepBlueColorScheme.white,
    primaryColor: DeepBlueColorScheme.primary,
    accentColor: DeepBlueColorScheme.primaryLight,
    primaryColorDark: DeepBlueColorScheme.secondary,
    primaryColorLight: DeepBlueColorScheme.secondary,
    cardTheme: CardTheme(color: DeepBlueColorScheme.secondary),
    textTheme:
        TextTheme(display1: TextStyle(color: DeepBlueColorScheme.secondary)),
    iconTheme: IconThemeData(color: DeepBlueColorScheme.secondary),
    bottomAppBarColor: DeepBlueColorScheme.white,
    dividerColor: DeepBlueColorScheme.secondary,
    colorScheme: ColorScheme(
        primary: DeepBlueColorScheme.primary,
        primaryVariant: DeepBlueColorScheme.primaryLight,
        secondary: DeepBlueColorScheme.secondary,
        secondaryVariant: DeepBlueColorScheme.secondary,
        surface: DeepBlueColorScheme.white,
        background: DeepBlueColorScheme.white,
        error: Colors.red,
        onPrimary: DeepBlueColorScheme.primary,
        onSecondary: DeepBlueColorScheme.secondary,
        onSurface: DeepBlueColorScheme.secondary,
        onBackground: DeepBlueColorScheme.white,
        onError: Colors.red,
        brightness: Brightness.light),
  );

  // TextStyles
  static InputDecoration getTextAreaDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide:
            BorderSide(color: jonthanMariaTheme.colorScheme.primaryVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: jonthanMariaTheme.colorScheme.secondary),
      ),
    );
  } 
}
