// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class AuthResponse {
  AuthResponse({required this.authValues, required this.statusCode});
  final AuthValues authValues;
  final int statusCode;
}

class AuthenticationHandler {
  late AuthValues authValues = AuthValues(
    email: '',
    firstName: '',
    lastName: '',
    position: '',
    accessLevel: '',
    windowNumber: '',
  );

  Future<AuthResponse> login(AuthArgs args) async {
    final response = await http.post(
      Uri.parse('https://34.28.165.38/ru/client/login/'),
      body: {
        'email': args.email,
        'password': args.password,
        'access': args.access ?? '',
        'refresh': args.refresh ?? '',
      },
    );
    var data = jsonDecode(response.body);
    authValues = AuthValues.fromJson(data);
    print(data);
    print('Status code: ${response.statusCode}');
    // return response.statusCode;
    return AuthResponse(
      authValues: authValues,
      statusCode: response.statusCode,
    );
  }

  Future<AuthResponse> refresh(AuthArgs args) async {
    final response = await http.post(
      Uri.parse('https://34.28.165.38/ru/client/refresh/'),
      body: {
        'refresh': args.refresh ?? '',
        'access': args.access ?? '',
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      authValues = AuthValues.fromJson(data);
      print(data);
      print('Status code: ${response.statusCode}');
    }
    return AuthResponse(
      authValues: authValues,
      statusCode: response.statusCode,
    );
  }
}




