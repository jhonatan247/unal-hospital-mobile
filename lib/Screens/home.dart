import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Bloc/user.dart';
import 'package:me_cuido/Screens/root.dart';
import 'package:me_cuido/Widgets/playground.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          Images.APP_LOGO,
          height: 22,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: <Widget>[
          FlatButton(
              child: Icon(
                Icons.menu,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              textColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                userBloc.signOut();
                Navigator.of(context)
                    .pushReplacementNamed(RootScreen.routeName);
              })
        ],
      ),
      body: Center(child: PlayGround()),
    );
  }
}
