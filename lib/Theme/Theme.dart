import 'package:flutter/material.dart';
import './color/colorScheme.dart';

class JhontanMariaTheme {
  const JhontanMariaTheme();
  static ThemeData jhontanMariaTheme = ThemeData(
    // Text themes
    fontFamily: 'NunitoSans',
    textTheme: TextTheme(
      title: TextStyle(
        color: DeepBlueColorScheme.secondary,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'Nunito',
      ),
      display1: TextStyle(
        color: DeepBlueColorScheme.secondary,
        fontSize: 18,
      ),
    ),
    primarySwatch: DeepBlueColorScheme.primarySwatch,
    backgroundColor: DeepBlueColorScheme.white,
    primaryColor: DeepBlueColorScheme.primary,
    accentColor: DeepBlueColorScheme.primaryLight,
    primaryColorDark: DeepBlueColorScheme.secondary,
    primaryColorLight: DeepBlueColorScheme.secondary,
    cardTheme: CardTheme(color: DeepBlueColorScheme.secondary),
    iconTheme: IconThemeData(color: DeepBlueColorScheme.secondary),
    bottomAppBarColor: DeepBlueColorScheme.white,
    dividerColor: DeepBlueColorScheme.secondary,
    colorScheme: ColorScheme(
        primary: DeepBlueColorScheme.primary,
        primaryVariant: DeepBlueColorScheme.primaryLight,
        secondary: DeepBlueColorScheme.secondary,
        secondaryVariant: DeepBlueColorScheme.secondary,
        surface: DeepBlueColorScheme.primary2,
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
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.secondary,
          width: 2,
        ),
      ),
      hintText: hint,
    );
  }

  static InputDecoration getMaterialIconTextFieldDecoration(
      String hint, IconData iconId) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.secondary,
          width: 2,
        ),
      ),
      hintText: hint,
      prefixIcon: Icon(
        iconId,
        color: jhontanMariaTheme.colorScheme.secondary,
      ),
    );
  }

  static InputDecoration getTextFieldDecoration(String hint, IconData iconId) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: jhontanMariaTheme.colorScheme.secondary,
          width: 2,
        ),
      ),
      hintText: hint,
      prefixIcon: Icon(iconId),
    );
  }

  static Color getGenericRaisedButtonTextColor(bool solid, bool enabled) {
    var color;
    if (enabled) {
      color = solid == true
          ? DeepBlueColorScheme.white
          : DeepBlueColorScheme.primary;
    } else {
      color = DeepBlueColorScheme.white;
    }
    return color;
  }

  static TextStyle getGenericRaisedButtonTextStyle(bool solid, bool enabled) {
    return TextStyle(
      color: getGenericRaisedButtonTextColor(solid, enabled),
      fontSize: 18,
    );
  }
}
