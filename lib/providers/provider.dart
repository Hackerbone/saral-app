import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saral/models/user.dart';
import 'package:http/http.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  Future getUser() async {
    final Uri baseUrl = Uri.parse(
        'https://o6j3ryyzf3.execute-api.ap-south-1.amazonaws.com/default/api');

    await get(baseUrl).then((response) {
      final Map userMap = jsonDecode(response.body);
      _user = User(email: userMap['email'], token: userMap['token']);
      print(_user);
      notifyListeners();
    });
  }
}
