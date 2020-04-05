import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Widgets/generic_raised_button.dart';
import 'package:me_cuido/Widgets/normal_text.dart';
import 'package:me_cuido/Widgets/title_text.dart';
import 'package:me_cuido/Widgets/top_decorator.dart';

class TriageFinished extends StatefulWidget {
  static String routeName = "triage_finished";

  @override
  _TriageFinishedState createState() => _TriageFinishedState();
}

class _TriageFinishedState extends State<TriageFinished> {
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
      body: Column(
        children: <Widget>[
          TopDecorator(),
          Container(
            height: MediaQuery.of(context).size.height - 220,
            padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[],
                ),
                Icon(
                  Icons.mood,
                  size: 70,
                  color: Theme.of(context).colorScheme.primary,
                ),
                TitleText(
                  '¡Gracias!',
                  align: TextAlign.center,
                ),
                NormalText(
                  'Esta información es muy valiosa para monitorear tu estado de salud y el de tu sector.\n\nEntre todos podemos cuidarnos para detener la propagación de Coronavirus',
                  align: TextAlign.center,
                ),
                GenericRaisedButton(
                  "volver al inicio",
                  () {
                    Navigator.of(context).pop();
                  },
                  prefixIcon: Icons.keyboard_arrow_left,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
