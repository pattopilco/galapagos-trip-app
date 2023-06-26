import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants/environment.dart';

class RestApiService {
  final String username;
  final String password;

  RestApiService({this.username = 'galavail', this.password = ''});

  Dio getDio() {
    return Dio(BaseOptions(baseUrl: Environment.apiUrl));
  }

  String getBasicAuth() {
    final basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }
}
