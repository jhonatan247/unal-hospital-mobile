import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiCheckWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(List<SelectorOption>) onChanged;

  MultiCheckWidget(this.options, this.onChanged);

  @override
  _MultipleCheckWidgetState createState() => _MultipleCheckWidgetState(options);
}

class _MultipleCheckWidgetState extends State<MultiCheckWidget> {
  final List<SelectorOption> optionsMarked = List();
  List<bool> _valuesList;

  _MultipleCheckWidgetState(List<SelectorOption> options) {
    _valuesList = List();
    for (int i = 0; i < options.length; i++) {
      _valuesList.add(false);
    }
  }

  Widget buildCheckBox(int index) {
    return Checkbox(
      activeColor: Color(0XFF113D52),
      value: _valuesList.elementAt(index),
      onChanged: (bool selectedStatus) {
        changeItemSelectedStatus(index, selectedStatus);
      },
    );
  }

  void changeItemSelectedStatus(int index, bool selectedStatus) {
    setState(() {
      _valuesList[index] = selectedStatus;

      SelectorOption previousSelected;
      for (SelectorOption option in optionsMarked) {
        if (option.name == widget.options.elementAt(index).name) {
          previousSelected = option;
          break;
        }
      }
      if (selectedStatus && previousSelected == null) {
        optionsMarked.add(widget.options.elementAt(index));
      } else if (!selectedStatus && previousSelected != null) {
        optionsMarked.remove(previousSelected);
      }
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
                width: 30,
              ),
              buildCheckBox(index),
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
