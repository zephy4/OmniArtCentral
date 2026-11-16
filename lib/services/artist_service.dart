import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseApiService {
  final String baseUrl = "https://1455-119-73-101-106.ngrok-free.app";
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    print('here it comes under post method ${baseUrl + endpoint} and $body');
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception('Connection Timed Out');
    });;
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}