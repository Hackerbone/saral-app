import 'package:flutter/material.dart';
import 'package:saral/screens/wrapper.dart';
import 'pages/landingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saral',
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
