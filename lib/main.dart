import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:me_cuido/Bloc/user.dart';
import 'package:me_cuido/Screens/home.dart';
import 'package:me_cuido/Screens/root.dart';
import 'package:me_cuido/Screens/splash.dart';
import 'package:me_cuido/Screens/welcome.dart';
import './Theme/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomeScreen.routeName: (context) => HomeScreen(),
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    RootScreen.routeName: (context) => RootScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          title: 'MeCuido',
          theme: JhontanMariaTheme.jhontanMariaTheme,
          home: SplashScreen(),
          routes: routes,
        ),
        bloc: UserBloc());
  }
}
