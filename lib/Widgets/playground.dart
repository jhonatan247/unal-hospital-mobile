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
          {
            'label': {
              'type': 'text',
              'content': 'Si',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'No',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'Tal vez',
            },
          },
        ],
        type: ExperimentInputTypes.RadialBox,
      ),
      Experiment(
        title: '¿Cómo te sentirás mañana?',
        label: {
          'type': 'text',
          'content': 'Test',
        },
        options: [
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'a',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'b',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'c',
            },
          },
        ],
        type: ExperimentInputTypes.Checkbox
      ),
      Experiment(
        title: '¿Cómo te sentirás pasadomañana?',
        label: {
          'type': 'text',
          'content': 'Test 2',
        },
        options: [
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': '1',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': '2',
            },
          },
          {
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': '3',
            },
          },
        ],
        type: ExperimentInputTypes.Text,
      ),
    ];

    return Triage(
        questions, () => print("returning home"), () => print("finished"));
  }
}
