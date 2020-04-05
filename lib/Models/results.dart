class Results {
  String userId;
  List<Map<String, Object>> answers;

  Results(
    this.userId,
    this.answers,
  );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'answers': answers,
    };
    
  }
}
