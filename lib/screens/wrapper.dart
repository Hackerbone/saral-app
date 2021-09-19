import 'package:flutter/material.dart';
import 'package:saral/screens/authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either home or auth
    return Authenticate();
  }
}
