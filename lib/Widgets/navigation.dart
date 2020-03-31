import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';
import './generic_raised_button.dart';

class NavigationWidget extends StatelessWidget {
  final int count;
  final int currentIndex;
  final void Function(int experimentIndex) onChange;

  NavigationWidget(
    this.count,
    this.currentIndex,
    this.onChange,
  );

  void onPreviousTab() {
    if (currentIndex == 0) {
      // Should'n be shown
    } else {
      onChange(currentIndex - 1);
    }
  }

  void onNextTab() {
    if (currentIndex + 1 == count) {
      // Shouldn't be shown
    } else {
      onChange(currentIndex + 1);
    }
  }


  @override
  Widget build(BuildContext context) {
    String backButtonText =
        currentIndex == 0 ? "Cancelar" : "Anterior";
    String nextButtonText =
        currentIndex + 1 == count ? "Finalizar" : "Siguiente";
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: <Widget>[
          GenericRaisedButton(
            backButtonText,
            onPreviousTab,
            prefixIcon: Icons.keyboard_arrow_left,
          ),
          GenericRaisedButton(
            nextButtonText,
            onNextTab,
            sufixIcon: Icons.keyboard_arrow_right,
            solid: true,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}