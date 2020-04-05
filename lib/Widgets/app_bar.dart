import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';

class AppBarWidget extends StatelessWidget {
  final bool showMenu;

  AppBarWidget({this.showMenu});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        Images.APP_LOGO,
        height: 22,
        alignment: Alignment.center,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      textTheme: TextTheme(
          title: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      actions: buildAppBarActions(context),
    );
  }

  List<Widget> buildAppBarActions(BuildContext context) {
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
}
