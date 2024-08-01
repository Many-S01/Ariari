import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class OpenAIService {
  Future<String> getResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.apiKey}',
      },
      body: jsonEncode({
        'model': Constants.modelId,
        'messages': [
          {"role": "system", "content": "당신은 청소년을 위한 경제 챗봇입니다."},
          {"role": "user", "content": message}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to get response from OpenAI');
    }
  }
}
