import 'package:flutter/material.dart';
import 'package:saral/screens/authenticate/login.dart';
import 'package:saral/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // make a is login var to check if the user is logged in shared preferences
  bool isLoggedIn = false;

  // shared preferences get user
  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('user');
  }

  @override
  void initState() {
    // get the user from shared preferences
    getUser().then((user) {
      if (user != null) {
        // if user is logged in, go to home screen
        isLoggedIn = true;
      } else {
        // if user is not logged in, go to login screen
        isLoggedIn = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Login(),
    );
  }
}
