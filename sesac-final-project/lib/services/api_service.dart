import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.example.com';

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return response;
  }

  // 다른 API 요청 메서드 정의
}
