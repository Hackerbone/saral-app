import 'package:flutter/material.dart';
import 'package:saral/pages/loginpage.dart';
import 'package:saral/utils/constants.dart';
import 'package:saral/pages/registerpage.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.white,
                // width: 200,
                // height: 200,
                child : Text("Logo Comes here")
                // child: SvgPicture.asset('assets/landing.svg'),
              ),
              Text(
                "Saral",
                style: GoogleFonts.yellowtail(fontSize: 50, color: textWhite),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Track your medical reports, along with checking your BP and stuff.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: textWhite,
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 40),
              //   child: Text(
              //     "What describes you the best?",
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.roboto(
              //       fontSize: 20,
              //       color: textWhite,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        primary: primaryBg,
                        backgroundColor: textColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 54, vertical: 16),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register()),
                        );
                      },
                      child: Text("Register"),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        primary: primaryBg,
                        backgroundColor: textColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
