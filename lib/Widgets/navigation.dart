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
    onChange(currentIndex - 1);
  }

  void onNextTab() {
    onChange(currentIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    String backButtonText = currentIndex == 0 ? "Cancelar" : "Anterior";
    String nextButtonText =
        currentIndex + 1 == count ? "Finalizar" : "Siguiente";
    return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            children: <Widget>[
              GenericRaisedButton(
                nextButtonText,
                canContinue ? onNextTab : null,
                sufixIcon: Icons.keyboard_arrow_right,
                solid: true,
              ),
              GenericRaisedButton(
                backButtonText,
                onPreviousTab,
                prefixIcon: Icons.keyboard_arrow_left,
              ),
            ],
          ),
        ));
  }
}
