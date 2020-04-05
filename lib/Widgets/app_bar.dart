import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';

AppBar buildAppBar(BuildContext context, bool showMenu) {
  MainAxisAlignment alignment = MainAxisAlignment.start;
  if (!showMenu) {
    alignment = MainAxisAlignment.center;
  }
  return AppBar(
    title: Row(
      mainAxisAlignment: alignment,
      children: <Widget>[
        SvgPicture.asset(
          Images.APP_LOGO,
          height: 22,
        )
      ],
    ),
    backgroundColor: Theme.of(context).backgroundColor,
    textTheme: TextTheme(
        title: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold)),
    actions: buildAppBarActions(context, showMenu),
  );
}

List<Widget> buildAppBarActions(BuildContext context, bool showMenu) {
  List<Widget> appBarActions = [];
  if (showMenu) {
    appBarActions.add(FlatButton(
        child: Icon(
          Icons.menu,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        textColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          print("menu icon was clicked");
        }));
  }
  return appBarActions;
}
