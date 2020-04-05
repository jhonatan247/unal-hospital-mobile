import 'package:flutter/material.dart';
import 'package:me_cuido/Models/experiment.dart';
import 'package:me_cuido/Models/fetch.dart';
import 'package:me_cuido/Models/results.dart';
import 'package:me_cuido/Models/selector_option.dart';
import 'package:me_cuido/Widgets/multi_check.dart';
import 'package:me_cuido/Widgets/multi_radio.dart';
import 'package:me_cuido/Widgets/navigation.dart';

class Triage extends StatefulWidget {
  final Function returnToHome;
  final Function finishTriage;

  Triage(
    this.returnToHome,
    this.finishTriage,
  );

  @override
  _TriageState createState() => _TriageState();
}

class _TriageState extends State<Triage> {
  Future<ExperimentList> futureQuestions;
  ExperimentList questions;

  Widget currentOptions;
  List<List<SelectorOption>> cashedAnswers = [];
  Results results = Results("this_is_a_dummy_user_id", []);
  int currentQuestion = 0;

  _TriageState();

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchQuestions();
    futureQuestions.then((response) {
      setState(() {
        questions = response;
        currentOptions = buildOptionsListFromExperimentData(
          questions.experiments[currentQuestion].options,
          questions.experiments[currentQuestion].type,
          0,
        );
        initAnswerObject(questions);
      });
      for (var i = 0; i < questions.experiments.length; i++) {
        cashedAnswers.add([]);
      }
    });
  }

  void initAnswerObject(ExperimentList questions) {
    questions.experiments.forEach((question) {
      results.answers.add({
        'questionId': question.id,
        'options': null,
      });
    });
  }

  void onQuestionChange(int questionIndex) {
    Widget newOptions = buildOptionsListFromExperimentData(
      questions.experiments[questionIndex].options,
      questions.experiments[questionIndex].type,
      questionIndex,
    );

    setState(() {
      currentQuestion = questionIndex;
      currentOptions = newOptions;
    });
  }

  Widget buildOptionsListFromExperimentData(
    List<Map<String, Object>> experimentData,
    ExperimentInputTypes questionType,
    int newIndex,
  ) {
    switch (questionType) {
      case ExperimentInputTypes.RadialBox: // Multiple options, single answer.
        return buildRadialBoxOptionListFromJsonData(
          experimentData,
          newIndex,
        );
        break;
      case ExperimentInputTypes.Checkbox: // Multiple options, multiple answers.
        return buildCheckboxOptionListFromJsonData(
          experimentData,
          newIndex,
        );
        break;
      case ExperimentInputTypes.Text: // Input text.
        break;
      default:
      // error en la generación de la pregunta? cómo manejaríamos errores acá?
    }
  }

  MultiRadioWidget buildRadialBoxOptionListFromJsonData(
    List<Map<String, Object>> experimentData,
    int index,
  ) {
    List<SelectorOption> buildedOptions = [];

    experimentData.forEach((opt) {
      var option = SelectorOption(
        opt['id'],
        (opt['label'] as Map<String, dynamic>)['content'] as String,
      );
      buildedOptions.add(option);
    });

    print("primera generación");
    print(currentQuestion);

    return MultiRadioWidget(
      buildedOptions,
      (SelectorOption option) {
        print("Onchange");
        print(currentQuestion);
        cashedAnswers[currentQuestion] = [option];
        List<Map<String, String>> optionsList = [
          getAnswersFromRadialBox(option)
        ];
        setState(() {
          results.answers[currentQuestion]['options'] = optionsList;
        });
      },
      optionMarked: cashedAnswers.isNotEmpty ? cashedAnswers[index][0] : null,
    );
  }

  Map<String, String> getAnswersFromRadialBox(SelectorOption answer) {
    Map<String, String> buildedAnswers = {
      'optionsId': answer.id,
      'value': 'true',
    };
    return buildedAnswers;
  }

  MultiCheckWidget buildCheckboxOptionListFromJsonData(
    List<Map<String, Object>> experimentData,
    int index,
  ) {
    List<SelectorOption> buildedOptions = [];

    experimentData.forEach((opt) {
      var option = SelectorOption(
        opt['id'],
        (opt['label'] as Map<String, dynamic>)['content'] as String,
      );
      buildedOptions.add(option);
    });

    print("primera generación");
    print(currentQuestion);
    print(index);

    return MultiCheckWidget(
      buildedOptions,
      (List<SelectorOption> options) {
        print("Onchange");
        print(currentQuestion);
        List<Map<String, String>> optionsList = getAnswersFromCheckbox(options);
        print(optionsList);
        setState(() {
          cashedAnswers[currentQuestion] = options;
          results.answers[currentQuestion]['options'] = optionsList;
        });
      },
      optionsMarked: cashedAnswers.isNotEmpty && cashedAnswers[index].isNotEmpty
          ? cashedAnswers[index]
          : null,
    );
  }

  List<Map<String, String>> getAnswersFromCheckbox(
      List<SelectorOption> answersList) {
    var formatedAnswers = List<Map<String, String>>();
    answersList.forEach((item) {
      Map<String, String> buildedAnswer = {
        'optionsId': item.id,
        'value': 'true',
      };
      formatedAnswers.add(buildedAnswer);
    });
    return formatedAnswers;
  }

  @override
  Widget build(BuildContext context) {
    if (questions != null) {
      String textContent =
          questions.experiments[currentQuestion].label['content'];
      double marginText = 20;
      if (textContent == null || textContent.isEmpty) {
        marginText = 0;
      }
      return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: NavigationWidget(
            questions.experiments.length,
            currentQuestion,
            onQuestionChange,
            canContinue: results.answers[currentQuestion]['options'] != null
                ? true
                : false,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    questions.experiments[currentQuestion].title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  SizedBox(
                    height: marginText,
                  ),
                  Text(
                    textContent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  SizedBox(
                    height: marginText,
                  ),
                  currentOptions,
                ],
              ),
            ),
          ));
    } else {
      return CircularProgressIndicator();
    }
  }
}
