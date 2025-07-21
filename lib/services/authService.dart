import 'dart:convert';

import 'package:SB_Global/models/registration_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static var client = http.Client();
  static String apiURL = "https://mobile.sbglobal.uk";

  Future<UserResponseModel> registerUser(UserModel model) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json'};

    print(model.toJson());
    var response = await client.post(
      Uri.parse("$apiURL/wp-json/wp/v2/users/register"),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return userResponseFromJson(response.body);
  }
}
