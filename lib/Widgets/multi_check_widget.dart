import 'package:flutter/material.dart';
import 'package:me_cuido/Models/selector_option.dart';

class MultiCheckWidget extends StatefulWidget {
  final List<SelectorOption> options;
  final void Function(List<SelectorOption>) onChanged;

  MultiCheckWidget({this.options, this.onChanged});

  @override
  _MultipleCheckWidgetState createState() => _MultipleCheckWidgetState(
      options: this.options, onChanged: this.onChanged);
}

class _MultipleCheckWidgetState extends State<MultiCheckWidget> {
  final List<SelectorOption> options;
  final void Function(List<SelectorOption>) onChanged;
  final List<SelectorOption> optionsMarked = List();
  List<bool> _valuesList;

  _MultipleCheckWidgetState({this.options, this.onChanged}) {
    _valuesList = List();
    for (int i = 0; i < options.length; i++) {
      _valuesList.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (options == null || options.length == 0) return Container();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.options.length,
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
        if (option.name == options.elementAt(index).name) {
          previousSelected = option;
          break;
        }
      }
      if (selectedStatus && previousSelected == null) {
        optionsMarked.add(options.elementAt(index));
      } else if (!selectedStatus && previousSelected != null) {
        optionsMarked.remove(previousSelected);
      }
      onChanged(optionsMarked);
    });
  }
}
