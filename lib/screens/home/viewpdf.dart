import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDF extends StatefulWidget {
  var url;

  ViewPDF({Key? key, required this.url}) : super(key: key);

  @override
  _ViewPDFState createState() => _ViewPDFState();
}

class _ViewPDFState extends State<ViewPDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Report'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              print(widget.url);
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        // widget.url.toString(),
        "https://saral-data.s3.ap-south-1.amazonaws.com/REPORT1.pdf",
        key: _pdfViewerKey,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Syncfusion PDF Viewer Demo',
//     home: HomePage(),
//   ));
// }

/// Represents Homepage for Navigation
// class HomePage extends StatefulWidget {
//   @override
//   _HomePage createState() => _HomePage();
// }

// class _HomePage extends State<HomePage> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//         ],
//       ),
//       body: SfPdfViewer.network(
//         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }