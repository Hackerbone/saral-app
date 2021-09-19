import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saral/screens/authenticate/login.dart';

class UploadReport extends StatefulWidget {
  UploadReport({Key? key}) : super(key: key);

  @override
  _UploadReportState createState() => _UploadReportState();
}

class _UploadReportState extends State<UploadReport> {
  late Map userData = {};
  void getUserData() async {
    final Uri baseUri = Uri.parse(
        "https://o6j3ryyzf3.execute-api.ap-south-1.amazonaws.com/default/api");

    Map data = {
      "operation": 'me',
      "payload": {"email": "situ@saral.com", "password": "pass", "did": "1234a"}
    };
    var response = await http.post(baseUri, body: json.encode(data));
    var jsonResponse = json.decode(response.body);
    setState(() {
      userData = jsonResponse;
    });
  }

  @override
  void initState() {
    getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          )
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'Upload!',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          _buildTile(
            Card(
              child: InkWell(
                onTap: () {
                  print("hI");
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Heart Rate',
                                  style: TextStyle(color: Colors.redAccent)),
                              Text(
                                  userData['healthParams'] != null
                                      ? userData['healthParams'][0]['heartRate']
                                          .toString()
                                      : "" + ' BPM',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32.0))
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.favorite,
                                  color: Colors.white, size: 30.0),
                            )))
                      ]),
                ),
              ),
            ),
          ),

          // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 40.0),

          StaggeredTile.extent(2, 110.0),
          // StaggeredTile.extent(2, 110.0),
          // StaggeredTile.extent(2, 100.0),
          // // StaggeredTile.extent(2, 220.0),
          // StaggeredTile.extent(2, 400.0),
        ],
      ),
    );
  }
}

Widget _buildTile(Widget child, {Function()? onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child));
}
