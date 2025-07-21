import 'dart:convert';
import 'package:http/http.dart' as http;

class WordPressRegistrationService {
  static const String _baseUrl = 'https://mobile.sbglobal.uk/';
  static const String _registerEndpoint = '/wp-json/wp/v2/users/register';

  Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$_registerEndpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Registration successful',
          'data': responseData,
        };
      } else {
        // Handle WordPress error responses
        String errorMessage = 'Registration failed';
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        } else if (responseData is String) {
          errorMessage = responseData;
        }
        return {
          'success': false,
          'message': errorMessage,
          'statusCode': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }
}


