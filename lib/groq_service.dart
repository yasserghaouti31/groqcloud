import 'package:http/http.dart' as http;
import 'dart:convert';

class GroqService {
  static const String _baseUrl =
      "https://api.groq.com/openai/v1/chat/completions";
  final String apiKey;

  GroqService(this.apiKey);

  Future<String> getResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "llama3-8b-8192",
          "messages": [
            {"role": "user", "content": message}
          ],
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['choices'][0]['message']['content'];
      } else {
        throw Exception(
            'Groq API Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }
}
