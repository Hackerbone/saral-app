import 'dart:convert';

import 'package:http/http.dart';
import 'package:saral/models/user.dart';

class AuthService {
  final String _baseUrl =
      "https://o6j3ryyzf3.execute-api.ap-south-1.amazonaws.com/default/api";

  User _userFromJson(Map user) {
    final userData = user;
    return User(email: userData['email'], token: userData['token']);
  }

  Future register(String email, String password, String name) async {
    try {
      final response = await post(
        Uri.parse(_baseUrl),
        body: json.encode({
          'operation': 'register',
          'payload': {'email': email, 'password': password}
        }),
      );
      print(response.body);
      return json.decode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future login(String email, String password, String name) async {
    try {
      final response = await post(
        Uri.parse(_baseUrl),
        body: json.encode({
          'operation': 'login',
          'payload': {'email': email, 'password': password}
        }),
      );
      print(response.body);
      return json.decode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
