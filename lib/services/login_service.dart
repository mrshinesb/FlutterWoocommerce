import 'dart:convert';

import 'package:SB_Global/models/login_model.dart';
import 'package:http/http.dart' as http;

class WordPressAuthService {
  static const String _baseUrl = 'https://mobile.sbglobal.uk/';
  static const String _loginEndpoint = '/wp-json/jwt-auth/v1/token';

  Future<Map<String, dynamic>> login(WordPressLoginModel loginModel) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$_loginEndpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginModel.toJson()),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'token': responseData['token'],
          'user': responseData['user_display_name'],
        };
      } else {
        String errorMessage = 'Login failed';
        if (responseData['message'] != null) {
          errorMessage = responseData['message'];
        } else if (responseData['code'] == 'incorrect_password') {
          errorMessage = 'Incorrect password';
        }
        return {
          'success': false,
          'message': errorMessage,
          'statusCode': response.statusCode,
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }
}
