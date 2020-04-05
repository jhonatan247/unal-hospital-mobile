import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiRadioWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(SelectorOption) onChanged;
  final SelectorOption optionMarked;

  MultiRadioWidget(
    this.options,
    this.onChanged, {
    this.optionMarked,
  });

  @override
  _MultiRadioWidgetState createState() => _MultiRadioWidgetState();
}

class _MultiRadioWidgetState extends State<MultiRadioWidget> {
  SelectorOption optionMarked;

  _MultiRadioWidgetState();

  @override
  void initState() {
    if (widget.optionMarked != null) {
      setState(() {
        optionMarked = widget.optionMarked;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.options.length == 0) return Container();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.options.length,
      itemBuilder: (BuildContext builderContext, int index) {
        var value = widget.options[index];
        if (widget.optionMarked != null &&
            widget.options[index].id == widget.optionMarked.id) {
          value = widget.optionMarked;
        }
        return Container(
          child: Row(
            children: <Widget>[
              Radio<SelectorOption>(
                activeColor: Theme.of(context).primaryColor,
                hoverColor: Theme.of(context).primaryColor,
                focusColor: Theme.of(context).primaryColor,
                value: value,
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
