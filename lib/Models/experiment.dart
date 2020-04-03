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

  factory Experiment.fromJson(Map<String, dynamic> json) {
    ExperimentInputTypes type;
    switch (json['type']) {
      case 'RadialBox':
        type = ExperimentInputTypes.RadialBox;
        break;
      case 'Checkbox':
        type = ExperimentInputTypes.Checkbox;
        break;
      case 'Text':
        type = ExperimentInputTypes.Text;
        break;
      default:
    }

    List<Map<String, Object>> options = [];
    (json['options'] as List<dynamic>).forEach((opt) {
      options.add(opt.cast<String, Object>());
    });

    Experiment experiment = Experiment(
      id: json['id'],
      title: json['title'],
      label: json['label'].cast<String, String>(),
      options: options,
      type: type,
    );
    return experiment;
  }
}

class ExperimentList {
  List<Experiment> experiments = [];

  ExperimentList(this.experiments);

  factory ExperimentList.fromJson(List<dynamic> json) {
    List<Experiment> experiments = [];
    json.forEach((item) {
      experiments.add(Experiment.fromJson(item));
    });
    return ExperimentList(experiments);
  }
}
