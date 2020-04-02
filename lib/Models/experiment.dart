enum ExperimentInputTypes {
  RadialBox,
  Checkbox,
  Text,
}

class Experiment {
  ExperimentInputTypes type;
  String title;
  Map<String, String> label;
  List<Map<String, Object>> options;

  Experiment({
    this.title,
    this.label,
    this.options,
    this.type,
  });
}
