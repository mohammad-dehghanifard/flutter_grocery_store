import 'package:flutter_grocery_store/backend/models/user_model.dart';

class RegisterResponse {
  User? user;
  String? token;

  RegisterResponse({this.user, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

