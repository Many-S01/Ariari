class EconomicGoal {
  final String id;
  final String description;
  bool isCompleted;

  EconomicGoal({required this.id, required this.description, this.isCompleted = false});

  factory EconomicGoal.fromJson(Map<String, dynamic> json) {
    return EconomicGoal(
      id: json['id'],
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}