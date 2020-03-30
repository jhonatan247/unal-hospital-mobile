import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';

class NavigationWidget extends StatefulWidget {
  final List<Experiment> experiments;
  final void Function() onFinish;
  final void Function(Experiment nextExperiment) onNext;
  final void Function(Experiment previousExperiment) onPrevious;
  final void Function() onCancel;

  NavigationWidget(
      {this.experiments,
      this.onFinish,
      this.onNext,
      this.onPrevious,
      this.onCancel});

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState(
      experiments: this.experiments,
      onFinish: this.onFinish,
      onNext: this.onNext,
      onPrevious: this.onPrevious,
      onCancel: this.onCancel);
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final List<Experiment> experiments;
  final void Function() onFinish;
  final void Function(Experiment nextExperiment) onNext;
  final void Function(Experiment previousExperiment) onPrevious;
  final void Function() onCancel;

  int currentExperimentIndex = 0;

  _NavigationWidgetState(
      {this.experiments,
      this.onFinish,
      this.onNext,
      this.onPrevious,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    String backButtonText = currentExperimentIndex == 0 ? "Cancel" : "Previous";
    String nextButtonText =
        currentExperimentIndex + 1 == experiments.length ? "Finish" : "next";
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: () {
            if (currentExperimentIndex == 0) {
              onCancel();
            } else {
              setState(() {
                currentExperimentIndex--;
                onPrevious(experiments.elementAt(currentExperimentIndex));
              });
            }
          },
          child: Row(
            children: <Widget>[Icon(Icons.arrow_back), Text(backButtonText)],
          ),
          color: Theme.of(context).backgroundColor,
        ),
        FlatButton(
          onPressed: () {
            if (currentExperimentIndex + 1 == experiments.length) {
              onFinish();
            } else {
              setState(() {
                currentExperimentIndex++;
                onNext(experiments.elementAt(currentExperimentIndex));
              });
            }
          },
          child: Row(
            children: <Widget>[Text(nextButtonText), Icon(Icons.arrow_forward)],
          ),
          color: Theme.of(context).primaryColor,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
