import 'package:flutter/material.dart';
import 'dart:convert';

// import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saral/pages/loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:saral/screens/home/UploadPdf.dart';
import 'package:saral/screens/home/viewpdf.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('Dashboard',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20.0)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                // fontSize: 16.0,
                // fontWeight: FontWeight.w700,
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
              'Welcome back!',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          _buildTile(
            Padding(
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
          _buildTile(
            Padding(
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
                          Text('SPO2',
                              style: TextStyle(color: Colors.blueAccent)),
                          Text(
                              userData['healthParams'] != null
                                  ? userData['healthParams'][0]['spo2']
                                          .toString() +
                                      '%'
                                  : "N/A",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32.0))
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.volunteer_activism_outlined,
                              color: Colors.white, size: 30.0),
                        )))
                  ]),
            ),
          ),
          // _buildTile(
          //   Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Material(
          //               color: Colors.teal,
          //               shape: CircleBorder(),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Icon(Icons.settings_applications,
          //                     color: Colors.white, size: 30.0),
          //               )),
          //           Padding(padding: EdgeInsets.only(bottom: 16.0)),
          //           Text('General',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w700,
          //                   fontSize: 24.0)),
          //           Text('Images, Videos',
          //               style: TextStyle(color: Colors.black45)),
          //         ]),
          //   ),
          // ),
          _buildTile(
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shadowColor: Colors.transparent,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadReport(),
                      ),
                    )
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Material(
                            color: Colors.amber,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.upload,
                                  color: Colors.white, size: 30.0),
                            )),
                        Padding(padding: EdgeInsets.only(bottom: 16.0)),
                        Container(
                          padding: EdgeInsets.only(right: 24.0),
                          child: Text('Upload Report',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          // _buildTile(
          //   Padding
          //       (
          //         padding: const EdgeInsets.all(16.0),
          //         child: Column
          //         (
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>
          //           [
          //             Row
          //             (
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>
          //               [
          //                 Column
          //                 (
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>
          //                   [
          //                     Text('Revenue', style: TextStyle(color: Colors.green)),
          //                     Text('\$16K', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
          //                   ],
          //                 ),
          //                 // DropdownButton
          //                 // (
          //                 //   isDense: true,
          //                 //   value: actualDropdown,
          //                 //   onChanged: (String value) => setState(()
          //                 //   {
          //                 //     actualDropdown = value;
          //                 //     actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
          //                 //   }),
          //                 //   items: chartDropdownItems.map((String title)
          //                 //   {
          //                 //     return DropdownMenuItem
          //                 //     (
          //                 //       value: title,
          //                 //       child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
          //                 //     );
          //                 //   }).toList()
          //                 // )
          //               ],
          //             ),
          //             Padding(padding: EdgeInsets.only(bottom: 4.0)),
          //             // Sparkline
          //             // (
          //             //   data: charts[actualChart],
          //             //   lineWidth: 5.0,
          //             //   lineColor: Colors.greenAccent,
          //             // )
          //           ],
          //         )
          //       ),
          // ),
          _buildTile(
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Reports',
                              style: TextStyle(color: Colors.green)),
                          Text(userData['reports'].length.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.picture_as_pdf,
                                    color: Colors.white, size: 30.0),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: MediaQuery.of(context).size.height * 0.8,
                    // color: Colors.teal,
                    child: ListView.builder(
                      itemCount: userData['reports'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            onTap: () => {
                                  print("HI"),
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ViewPDF(
                                        url: userData['reports'][index],
                                      ),
                                    ),
                                  )
                                },
                            leading: Icon(
                              Icons.picture_as_pdf,
                              size: 40,
                              color: Colors.red,
                            ),
                            title: Text("Report ${index + 1}"));
                      },
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Card(
                //         child: new InkWell(
                //           onTap: () {
                //             print("tapped");
                //           },
                //           child: Container(
                //             width: MediaQuery.of(context).size.width * 0.8,
                //             height: 100.0,
                //             child: Row(
                //               children: [
                //                 // icon widget
                //                 Container(
                //                   padding:
                //                       EdgeInsets.only(left: 24.0, right: 24),
                //                   child: Icon(
                //                     Icons.picture_as_pdf,
                //                     size: 40,
                //                     color: Colors.red,
                //                   ),
                //                 ),
                //                 Text(
                //                   'Report 1',
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 24.0),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 40.0),

          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 100.0),
          // StaggeredTile.extent(2, 220.0),
          StaggeredTile.extent(2, 400.0),
        ],
      ),
    );
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
}
