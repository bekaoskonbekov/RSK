import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rsk1/features/auth/model/user_model.dart';

class Service {
  final String baseUrl = "http://34.28.165.38/ru/";
  final dio = Dio();
  Future<User?> login(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    var response = await dio.post(baseUrl + "client/login/", data: json);
    if (response.statusCode == 200) {
      var result = User.fromJson(response.data);
      log("Get Response => ${response.data}");
      return result;
    } else {
      throw ("Error  ${response.statusCode}");
    }
  }
}