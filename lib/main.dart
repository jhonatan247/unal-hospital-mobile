import 'package:flutter/material.dart';
import 'package:me_cuido/Screens/home.dart';
import 'package:me_cuido/Screens/splash.dart';
import 'package:me_cuido/Screens/triage.dart';
import 'package:me_cuido/Screens/triage_finished.dart';
import 'package:me_cuido/Screens/welcome.dart';
import './Theme/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomeScreen.routeName: (context) => HomeScreen(),
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    Triage.routeName: (context) => Triage(),
    TriageFinished.routeName: (context) => TriageFinished(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeCuido',
      theme: JhontanMariaTheme.jhontanMariaTheme,
      home: SplashScreen(),
      routes: routes,
    );
  }
}
