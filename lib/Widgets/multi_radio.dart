import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiRadioWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(SelectorOption) onChanged;

  MultiRadioWidget({this.options, this.onChanged});

  @override
  _MultiRadioWidgetState createState() =>
      _MultiRadioWidgetState(options: this.options, onChanged: this.onChanged);
}

class _MultiRadioWidgetState extends State<MultiRadioWidget> {
  final List<SelectorOption> options;
  final void Function(SelectorOption) onChanged;
  SelectorOption optionMarked;

  _MultiRadioWidgetState({this.options, this.onChanged});

  @override
  Widget build(BuildContext context) {
    if (options.length == 0) return Container();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.options.length,
      itemBuilder: (BuildContext builderContext, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              Radio<SelectorOption>(
                activeColor: Color(0XFF113D52),
                value: options.elementAt(index),
                groupValue: optionMarked,
                onChanged: (SelectorOption value) {
                  setState(() {
                    optionMarked = value;
                    onChanged(optionMarked);
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  this.options.elementAt(index).name,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
