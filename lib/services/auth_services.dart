import 'package:auth_nodejs_backend/model/user.dart';
import 'package:auth_nodejs_backend/utils/const.dart';
import 'package:auth_nodejs_backend/utils/error_handle.dart';
import 'package:auth_nodejs_backend/utils/snackbars.dart';
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

      http.Response response = await http.post(
          Uri.parse("${Const.url}/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
          });

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account created login ");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
