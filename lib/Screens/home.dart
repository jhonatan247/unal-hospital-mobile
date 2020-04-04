import 'package:flutter/material.dart';
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
        title: Text("MeCuido"),
        backgroundColor: Theme.of(context).backgroundColor,
        textTheme: TextTheme(
            title: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          FlatButton(
              child: Row(
                children: <Widget>[
                  Text("Jhonatan"),
                  Icon(Icons.person),
                ],
              ),
              textColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                print("user icon was clicked");
              })
        ],
      ),
      body: Center(child: PlayGround()),
    );
  }
}
