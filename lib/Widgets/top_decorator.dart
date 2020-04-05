import 'package:flutter/material.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Widgets/title_text.dart';

class TopDecorator extends StatelessWidget {
  final String text;

  TopDecorator({this.text});

  @override
  Widget build(BuildContext context) {
    Widget mainRow;
    if (text != null) {
      mainRow = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Image.asset(
              Images.TOP_DECORATOR_A,
            ),
            TitleText(text),
          ]);
    } else {
      mainRow = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Image.asset(
              Images.TOP_DECORATOR_B,
              width: 200,
              fit: BoxFit.cover,
              alignment: Alignment(-1.0, -1.0),
            ),
          ]);
    }

    return Container(
      child: Stack(
        
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 50),
            alignment: Alignment.centerLeft,
            height: text != null ? 140 : 70,
            color: Theme.of(context).colorScheme.surface,
            child: mainRow,
          ),
          Container(
            margin: EdgeInsets.only(top: text != null ? 120 : 50,),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
