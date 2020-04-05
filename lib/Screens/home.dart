import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Screens/triage.dart';
import 'package:me_cuido/Widgets/generic_raised_button.dart';
import 'package:me_cuido/Widgets/normal_text.dart';
import 'package:me_cuido/Widgets/playground.dart';
import 'package:me_cuido/Widgets/top_decorator.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
      //body: Center(child: PlayGround()),
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TopDecorator(),
            Container(
              padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: NormalText(
                'Te invitamos a que reportes cualquier novedad sobre tu estado de salud. Entre todos podemos cuidarnos para detener la propagación de Coronavirus',
                align: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: GenericRaisedButton(
                'Quiero reportar',
                () => Navigator.pushNamed(context, Triage.routeName),
                solid: true,
                sufixIcon: Icons.mood,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
