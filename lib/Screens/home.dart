import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Widgets/playground.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          Images.APP_LOGO,
          height: 22,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        textTheme: TextTheme(
            title: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          FlatButton(
              child: Icon(
                Icons.menu,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              textColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                print("menu icon was clicked");
              })
        ],
      ),
      body: Center(child: PlayGround()),
    );
  }
}
