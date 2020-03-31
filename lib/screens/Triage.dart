import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';
import 'package:me_cuido/Models/selector_option.dart';
import 'package:me_cuido/Widgets/multi_radio.dart';
import 'package:me_cuido/Widgets/navigation.dart';

class Triage extends StatefulWidget {
  final List<Experiment> questions;
  final Function returnToHome;
  final Function finishTriage;

  Triage(
    this.questions,
    this.returnToHome,
    this.finishTriage,
  );

  @override
  _TriageState createState() => _TriageState(
        this.questions,
        this.returnToHome,
        this.finishTriage,
      );
}

class _TriageState extends State<Triage> {
  final List<Experiment> questions;
  final Function returnToHome;
  final Function finishTriage;

  int currentQuestion = 0;

  final List<SelectorOption> options = [
    SelectorOption(name: 'First'),
    SelectorOption(name: 'Second option'),
    SelectorOption(name: 'Third option'),
    SelectorOption(name: 'Fourth option')
  ];

  void onQuestionChange(int questionIndex) {
    setState(() {
      currentQuestion = questionIndex;
    });
  }

  _TriageState(this.questions, this.returnToHome, this.finishTriage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: NavigationWidget(
        questions.length,
        currentQuestion,
        onQuestionChange,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          children: <Widget>[
            Text(
              questions[currentQuestion].title,
              style: Theme.of(context).textTheme.display1,
            ),
            MultiRadioWidget(
              options: this.options,
              onChanged: (SelectorOption option) {
                print('OPTIONS MARKED');
                print(option.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
