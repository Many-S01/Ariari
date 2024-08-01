import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/economic_goal.dart';

class ApiService {
  static const String baseUrl = 'http://your-backend-url.com/api';

  static Future<List<String>> getQuestions() async {
    final response = await http.get(Uri.parse('$baseUrl/questions'));
    if (response.statusCode == 200) {
      List<dynamic> questionsJson = json.decode(response.body);
      return questionsJson.cast<String>();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  static Future<String> askQuestion(String question) async {
    final response = await http.post(
      Uri.parse('$baseUrl/ask'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'question': question}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['answer'];
    } else {
      throw Exception('Failed to get answer');
    }
  }

  static Future<List<EconomicGoal>> getEconomicGoals() async {
    final response = await http.get(Uri.parse('$baseUrl/goals'));
    if (response.statusCode == 200) {
      List<dynamic> goalsJson = json.decode(response.body);
      return goalsJson.map((json) => EconomicGoal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load goals');
    }
  }

  static Future<EconomicGoal> setEconomicGoal(String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/goals'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'description': description}),
    );
    if (response.statusCode == 201) {
      return EconomicGoal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create goal');
    }
  }

  static Future<EconomicGoal> updateEconomicGoal(String id, bool isCompleted) async {
    final response = await http.put(
      Uri.parse('$baseUrl/goals/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'isCompleted': isCompleted}),
    );
    if (response.statusCode == 200) {
      return EconomicGoal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update goal');
    }
  }
}