import 'package:flutter/material.dart';
import 'package:me_cuido/Screens/triage.dart';
import 'package:me_cuido/Models/experiment.dart';

class PlayGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Experiment> questions = [
      Experiment(
        title: '¿Cómo te sientes hoy?',
        label: {
          'type': 'text',
          'content':
              'Por favor, indícanos si sientes que presentas uno o más síntomas de la enfermedad COVID-19.'
        },
        options: [
          {'text': 'text'}
        ],
      ),
      Experiment(
        title: '¿Cómo te sentirás mañana?',
        label: {
          'type': 'text',
          'content':
              'Test'
        },
        options: [
          {'text': 'text'}
        ],
      ),
      Experiment(
        title: '¿Cómo te sentirás pasadomañana?',
        label: {
          'type': 'text',
          'content':
              'Test 2'
        },
        options: [
          {'text': 'text'}
        ],
      ),
    ];

    return Triage(
        questions, () => print("returning home"), () => print("finished"));
  }
}
