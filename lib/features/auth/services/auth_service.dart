import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utilty.dart';
import '../model/user_model.dart';
final authServiceProvider = Provider((ref) {
  return AuthService();
});

class AuthService {
  UserModel currentUser = UserModel();
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String password_confirm,
  }) async {
    try {
      Map<String, dynamic> user = {
        "fullname": firstName,
        "lastname": lastName,
        "email": email,
        "password": password,
        "password_confirm": password_confirm,
      };
      http.Response response = await http.post(
        Uri.parse("https://34.28.165.38/ru/client/register/"),
        body: jsonEncode(user),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'charset': 'UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccessMessage:
              'SignUp Successfull.Now, Login with same credentials.!!',
          onfailureMessage:
              'SignUp Failed !! There exists a user with same credentials.');
    } on Exception catch (e) {
      log(e.toString());

      showSnackBar(context, e.toString());
    }
  }

  Future<UserModel> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> user = {
        "email": email,
        "password": password,
      };
      http.Response response = await http.post(
        Uri.parse("https://34.28.165.38/ru/client/login/"),
        body: jsonEncode(user),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'charset': 'UTF-8',
        },
      );
      var recvdata = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          currentUser = UserModel.fromJson(recvdata['data']);
          showSnackBar(context, 'Successfully LoggedIn !!');
          SharedPreferences sp = await SharedPreferences.getInstance();
          await sp.setString('x-auth-token', currentUser.refresh ?? '');
          await sp.setString('user-id', currentUser.userid ?? '');
        },
        onfailure: () {
          currentUser.userid = null;
        },
      );
    } on Exception catch (e) {
      log(e.toString());

      showSnackBar(context, e.toString());
    }
    return currentUser;
  }
}



