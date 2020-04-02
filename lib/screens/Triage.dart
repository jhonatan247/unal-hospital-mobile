import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';
import 'package:me_cuido/Models/selector_option.dart';
import 'package:me_cuido/Widgets/multi_check.dart';
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
  _TriageState createState() => _TriageState(this.questions);
}

class _TriageState extends State<Triage> {
  final List<Experiment> questions;

  Widget currentOptions;
  int currentQuestion = 0;

  _TriageState(this.questions) {
    currentOptions = buildOptionsListFromExperimentData(
        questions[currentQuestion].options, questions[currentQuestion].type);
  }

  void onQuestionChange(int questionIndex) {
    Widget newOptions = buildOptionsListFromExperimentData(
        questions[questionIndex].options, questions[questionIndex].type);

    setState(() {
      currentQuestion = questionIndex;
      currentOptions = newOptions;
    });
  }

  Widget buildOptionsListFromExperimentData(
      List<Map<String, Object>> experimentData,
      ExperimentInputTypes questionType) {
    switch (questionType) {
      case ExperimentInputTypes.RadialBox: // Multiple options, single answer.
        print("RadialBox");
        return buildRadialBoxOptionListFromJsonData(experimentData);
        break;
      case ExperimentInputTypes.Checkbox: // Multiple options, multiple answers.
        print("Checkbox");
        return buildCheckboxOptionListFromJsonData(experimentData);
        break;
      case ExperimentInputTypes.Text: // Input text.
        print("Text");
        break;
      default:
      // error en la generación de la pregunta? cómo manejaríamos errores acá?
    }
  }

  MultiRadioWidget buildRadialBoxOptionListFromJsonData(
      List<Map<String, Object>> experimentData) {
    List<SelectorOption> buildedOptions = [];

    experimentData.forEach((opt) {
      var option = SelectorOption(
        name: (opt['label'] as Map<String, String>)['content'],
      );
      buildedOptions.add(option);
    });

    return MultiRadioWidget(
      buildedOptions,
      (SelectorOption option) {
        print(option.name);
      },
    );
  }

  MultiCheckWidget buildCheckboxOptionListFromJsonData(
      List<Map<String, Object>> experimentData) {
    List<SelectorOption> buildedOptions = [];

    experimentData.forEach((opt) {
      var option = SelectorOption(
        name: (opt['label'] as Map<String, String>)['content'],
      );
      buildedOptions.add(option);
    });

    return MultiCheckWidget(
      buildedOptions,
      (List<SelectorOption> options) {
        options.forEach((opt) => print(opt.name));
      },
    );
  }

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
            Text(
              questions[currentQuestion].label['content'],
              style: Theme.of(context).textTheme.display1,
            ),
            currentOptions,
          ],
        ),
      ),
    );
  }
}
