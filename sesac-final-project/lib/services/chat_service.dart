import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class ChatService {
  Future<String> sendMessage(String message, {String? persona}) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.apiKey}',
      },
      body: jsonEncode({
        'model': Constants.modelId,
        'messages': [
          {
            "role": "system",
            "content": persona ?? "You are a helpful assistant."
          },
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
