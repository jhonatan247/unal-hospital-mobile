import 'dart:async';

import 'package:flutter/material.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                Images.APP_ICON_FULL,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(Images.UNAL_LOGO),
              Image.asset(Images.HUN_LOGO)
            ],
          ),
        ));
  }
}
