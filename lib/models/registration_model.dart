import 'dart:convert';

UserResponseModel userResponseFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

class UserModel {
  String name;
  String email;
  String password;

  UserModel({required this.name, required this.email, required this.password});

  UserModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      email = json['email'] as String,
      password = json['password'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class UserResponseModel {
  int code;
  String message;

  UserResponseModel(this.code, this.message);

  UserResponseModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int,
      message = json['message'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
