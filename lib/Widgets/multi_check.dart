import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiCheckWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(List<SelectorOption>) onChanged;
  final List<SelectorOption> optionsMarked;

  MultiCheckWidget(
    this.options,
    this.onChanged, {
    this.optionsMarked,
  });

  @override
  _MultipleCheckWidgetState createState() => _MultipleCheckWidgetState(options);
}

class _MultipleCheckWidgetState extends State<MultiCheckWidget> {
  final List<SelectorOption> options;

  _MultipleCheckWidgetState(this.options);

  Widget buildCheckBox(BuildContext context, int index) {
    return Checkbox(
      activeColor: Theme.of(context).primaryColor,
      hoverColor: Theme.of(context).primaryColor,
      checkColor: Theme.of(context).backgroundColor,
      focusColor: Theme.of(context).primaryColor,
      value: widget.options[index].isSelected,
      onChanged: (bool selectedStatus) {
        changeItemSelectedStatus(index, selectedStatus);
      },
    );
  }

  void changeItemSelectedStatus(int index, bool selectedStatus) {
    setState(() {
      widget.options[index].isSelected = selectedStatus;
      List<SelectorOption> optionsMarked = [];

      widget.options.forEach((opt) => {
            if (opt.isSelected) {optionsMarked.add(opt)}
          });
      widget.onChanged(optionsMarked);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.options == null || widget.options.length == 0)
      return Container();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.options.length,
      itemBuilder: (BuildContext builderContext, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              buildCheckBox(context, index),
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