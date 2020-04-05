import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:me_cuido/Models/experiment.dart';

// Get questions from back
Future<ExperimentList> fetchQuestions() async {
  final response = await http.get('https://us-central1-poc-test-unal-hospital.cloudfunctions.net/questions');
  //final response = await http.get('https://my-json-server.typicode.com/aldiazve/json-tester/question');
  if (response.statusCode == 200) {
    return ExperimentList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Json');
  }
}