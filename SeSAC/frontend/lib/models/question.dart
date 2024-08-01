// frontend/lib/models/question.dart
class Question {
  final String id;
  final String question;
  final String answer;

  Question({required this.id, required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}