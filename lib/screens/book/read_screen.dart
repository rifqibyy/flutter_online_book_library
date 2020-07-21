import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReadScreen extends StatefulWidget {
  final path;
  ReadScreen({this.path});

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> with WidgetsBindingObserver {
  bool isReady = false;
  String _path;
  int totalPages = 0;
  int currentPage = 0;

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    fromAsset(widget.path, widget.path.split('/')[2]).then((value) {
      setState(() {
        _path = value.path;
        isReady = true;
      });
    });
  }

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (!isReady)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: PDFView(
                    filePath: _path,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: true,
                    pageSnap: true,
                    defaultPage: currentPage,
                    fitPolicy: FitPolicy.BOTH,
                    preventLinkNavigation: false,
                    onRender: (pages) {
                      setState(() {
                        totalPages = pages;
                      });
                    },
                    onViewCreated: (controller) {
                      _controller.complete(controller);
                    },
                    onPageChanged: (page, total) {
                      setState(() {
                        currentPage = page;
                        totalPages = total;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$currentPage / $totalPages'),
                    FutureBuilder<PDFViewController>(
                        future: _controller.future,
                        builder: (ctx, snapshot) {
                          return RaisedButton(
                            child: Text('Go To Page ${totalPages ~/ 2}'),
                            onPressed: () {
                              snapshot.data.setPage(totalPages ~/ 2);
                            },
                          );
                        }),
                  ],
                )
              ],
            ),
    );
  }
}
