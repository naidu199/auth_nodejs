import 'dart:convert';

import 'package:auth_nodejs_backend/model/user.dart';
import 'package:auth_nodejs_backend/providers/user_provider.dart';
import 'package:auth_nodejs_backend/utils/const.dart';
import 'package:auth_nodejs_backend/utils/error_handle.dart';
import 'package:auth_nodejs_backend/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Authservices {
  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          username: username,
          token: '');

      
      final uri = Uri.parse("${Const.url}api/signup");
      
      http.Response response = await http.post(
        uri,
        body: user.toJson(),
        headers: <String, String>{
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account created login ");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  void signinUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final uri = Uri.parse("${Const.url}api/signin");
      http.Response response = await http.post(
        uri,
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: response, context: context, onSuccess: () async {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
