import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';
import 'package:me_cuido/Models/selector_option.dart';
import 'package:me_cuido/Widgets/multi_radio_widget.dart';
import 'package:me_cuido/Widgets/navigation_widget.dart';

class PlayGround extends StatelessWidget {
  Experiment currentExperiment;

  final List<SelectorOption> options = [
    SelectorOption(name: 'First'),
    SelectorOption(name: 'Second option'),
    SelectorOption(name: 'Third option'),
    SelectorOption(name: 'Fourth option')
  ];

  final List<Experiment> questions = [
    Experiment(title: 'First experiment'),
    Experiment(title: 'Second experiment'),
    Experiment(title: 'Third experiment'),
    Experiment(title: 'Fourth experiment')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: NavigationWidget(
        experiments: questions,
        onCancel: () {
          print("Cancel");
        },
        onFinish: () {
          print("Finsih");
        },
        onNext: (Experiment nextExperiment) {
          print("Next");
          print(nextExperiment.title);
        },
        onPrevious: (Experiment previousExperiment) {
          print("Previous");
          print(previousExperiment.title);
        },
      ),
      body: Column(
        children: <Widget>[
          MultiRadioWidget(
            options: this.options,
            onChanged: (SelectorOption option) {
              print('OPTIONS MARKED');
              print(option.name);
            },
          ),
        ],
      ),
    );
  }
}
