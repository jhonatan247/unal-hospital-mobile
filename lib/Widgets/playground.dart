import 'package:flutter/material.dart';
import 'package:me_cuido/Screens/triage.dart';
import 'package:me_cuido/Models/experiment.dart';

class PlayGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Experiment> questions = [
      Experiment(
        id: "q_ID_1",
        title: '¿Cómo te sientes hoy?',
        label: {
          'type': 'text',
          'content':
              'Por favor, indícanos si sientes que presentas uno o más síntomas de la enfermedad COVID-19.'
        },
        options: [
          {
            'id': "aa",
            'label': {
              'type': 'text',
              'content': 'Si',
            },
          },
          {
            'type': 'radial-box',
            'id': "bb",
            'label': {
              'type': 'text',
              'content': 'No',
            },
          },
          {
            'type': 'radial-box',
            'id': "cc",
            'label': {
              'type': 'text',
              'content': 'Tal vez',
            },
          },
        ],
        type: ExperimentInputTypes.RadialBox,
      ),
      Experiment(
        id: "q_ID_2",
        title: '¿Cómo te sentirás mañana?',
        label: {
          'type': 'text',
          'content': 'Test',
        },
        options: [
          {
            'id': 'aa',
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'a',
            },
          },
          {
            'id': 'ee',
            'type': 'radial-box',
            'label': {
              'type': 'text',
              'content': 'b',
            },
          },
          {
            'id': 'ii',
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
        id: "q_ID_3",
        title: '¿Cómo te sentirás pasadomañana?',
        label: {
          'type': 'text',
          'content': 'Test 2',
        },
        options: [
          {
            'type': 'text',
            'id': 'ee',
            'label': {
              'type': 'text',
              'content': 'This is the placeholder.',
            },
          },
        ],
        type: ExperimentInputTypes.Text,
      ),
    ];

    return Triage(
        () => print("returning home"), () => print("finished"));
  }
}
