import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiService {
  final String baseUrl = 'https://api.myapp.com'; // Update to your backend URL
  final AuthService _auth = AuthService();

  Future<Map<String, dynamic>?> getUserProfile() async {
    final token = await _auth.getValidAccessToken();
    if (token == null) return null;

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/user/profile'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Example of another API call
  Future<bool> createPost(String content) async {
    final token = await _auth.getValidAccessToken();
    if (token == null) return false;

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/user/posts'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'content': content}),
      );

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>?> getPosts() async {
    final token = await _auth.getValidAccessToken();
    if (token == null) return null;

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/user/posts'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
