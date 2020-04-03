enum ExperimentInputTypes {
  RadialBox,
  Checkbox,
  Text,
}

class Experiment {
  String id;
  ExperimentInputTypes type;
  String title;
  Map<String, String> label;
  List<Map<String, Object>> options;

  Experiment({
    this.id,
    this.title,
    this.label,
    this.options,
    this.type,
  });
}
