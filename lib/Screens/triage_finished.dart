import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_cuido/Assets/images.dart';

class TriageFinished extends StatefulWidget {
  static String routeName = "triage_finished";
  @override
  _TriageFinishedState createState() => _TriageFinishedState();
}

class _TriageFinishedState extends State<TriageFinished> {
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
      body: Container(
        padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '¡Gracias!',
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                'Esta información es muy valiosa para monitorear tu estado de salud y el de tu sector.\n\nEntre todos podemos cuidarnos para detener la propagación de Coronavirus',
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
