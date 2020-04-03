import 'package:flutter/material.dart';
import './generic_raised_button.dart';

class NavigationWidget extends StatelessWidget {
  final int count;
  final int currentIndex;
  final void Function(int experimentIndex) onChange;
  final bool canContinue;

  NavigationWidget(
    this.count,
    this.currentIndex,
    this.onChange, {
    this.canContinue = false,
  });

  void onPreviousTab() {
    if (currentIndex == 0) {
      onChange(currentIndex);
    } else {
      onChange(currentIndex - 1);
    }
  }

  void onNextTab() {
    if (currentIndex + 1 == count) {
      onChange(currentIndex);
    } else {
      onChange(currentIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    String backButtonText = currentIndex == 0 ? "Cancelar" : "Anterior";
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
            canContinue ? onNextTab : null,
            sufixIcon: Icons.keyboard_arrow_right,
            solid: true,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
