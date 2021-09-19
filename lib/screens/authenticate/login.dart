import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:saral/pages/dashboard.dart';
import 'package:saral/pages/landingpage.dart';
import 'package:saral/screens/authenticate/register.dart';
import 'package:http/http.dart' as http;
import 'package:saral/screens/home/home.dart';
import 'package:saral/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saral/components/InputField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email =
      new TextEditingController(text: "situ@saral.com");
  TextEditingController password = new TextEditingController(text: "pass");

  signIn(String email, String password) async {
    Map data = {
      "operation": 'login',
      "payload": {
        "email": email,
        "password": password,
      }
    };
    final Uri baseUri = Uri.parse(
        "https://o6j3ryyzf3.execute-api.ap-south-1.amazonaws.com/default/api");
    var jsonResponse;

    var response = await http.post(baseUri, body: json.encode(data));
    print("HI");
    print(data);
    // jsonResponse = json.decode(response.body);
    print(response);
    if (email == "situ@saral.com") {
      print("HI");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", response.body.toString());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => new Home()));
    }
    // Map data = {"email": email, "password": password, "client": "false"};
    // var jsonData = null;
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var url = Uri.parse('http://YourIP/user/login');
    // var response = await http.post(url, body: data);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // var jsonData = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: Text(
    //         "Login Successful",
    //         style: TextStyle(
    //           color: textWhite,
    //         ),
    //       ),
    //       content: Text(
    //         "Continue to dashboard",
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           color: textWhite,
    //         ),
    //       ),
    //       backgroundColor: primaryBg,
    //     ),
    //   );
    //   setState(() {
    //     print("Client");
    //     print(jsonData['data']['client']);

    //     prefs.setString('email', jsonData['data']['email'].toString());
    //     prefs.setString('name', jsonData['data']['name'].toString());
    //     prefs.setString('phone', jsonData['data']['phone'].toString());
    //   });
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Dashboard()),
    //   );
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: Text(
    //         "Login unsuccessful",
    //         style: TextStyle(
    //           color: textWhite,
    //         ),
    //       ),
    //       content: Text(
    //         jsonData['error'],
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           color: textWhite,
    //         ),
    //       ),
    //       backgroundColor: primaryBg,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: 50),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(Icons.home_filled, color: textWhite, size: 30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Landing()),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150,
                margin: EdgeInsets.only(bottom: 50),
                // child: SvgPicture.asset('assets/freelance.svg'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saral",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Login",
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Please sign in to continue 1",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              inputFields(
                  "Email",
                  Icon(
                    Icons.mail_outline,
                    color: textWhite,
                  ),
                  false,
                  email),
              inputFields(
                  "Password",
                  Icon(
                    Icons.lock,
                    color: textWhite,
                  ),
                  true,
                  password),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainPage()),
                    // );
                    signIn(email.text, password.text);
                  },
                  child: Text("LOGIN"),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    primary: primaryBg,
                    backgroundColor: textColor,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                  style: TextButton.styleFrom(
                    primary: textColor,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 60, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: secondaryText),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text("Sign Up"),
                        style: TextButton.styleFrom(
                          primary: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
