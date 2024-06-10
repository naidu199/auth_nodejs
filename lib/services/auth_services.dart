import 'package:auth_nodejs_backend/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authservices {
  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      User user = User(id: '', email: email, username: username, token: '');

      http.Response response = await http
          .post(Uri.parse("localhost:3000/api/signup"), body: user.toJson());
    } catch (e) {}
  }
}
