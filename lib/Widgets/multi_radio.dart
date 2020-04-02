import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiRadioWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(SelectorOption) onChanged;

  MultiRadioWidget(this.options, this.onChanged);

  @override
  _MultiRadioWidgetState createState() => _MultiRadioWidgetState();
}

class _MultiRadioWidgetState extends State<MultiRadioWidget> {
  SelectorOption optionMarked;

  _MultiRadioWidgetState();

  @override
  Widget build(BuildContext context) {
    if (widget.options.length == 0) return Container();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.options.length,
      itemBuilder: (BuildContext builderContext, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              Radio<SelectorOption>(
                activeColor: Color(0XFF113D52),
                value: widget.options.elementAt(index),
                groupValue: optionMarked,
                onChanged: (SelectorOption value) {
                  setState(() {
                    optionMarked = value;
                  });
                  widget.onChanged(optionMarked);
                },
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  widget.options.elementAt(index).name,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.display1,
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
