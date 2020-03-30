import 'package:flutter/material.dart';
import './Theme/Theme.dart';

//Customs imports
import './Widgets/playground.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me cuido',
      theme: JhontanMariaTheme.jonthanMariaTheme,
      home: MyHomePage(title: '👌 Me cuido'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
