import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BeritaScreen extends StatefulWidget {
  final String url;

  BeritaScreen({required this.url});

  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  late WebViewController _webViewController;
  // bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _webViewController.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _webViewController = controller;
            },
            // onPageStarted: (String url) {
            //   setState(() {
            //     _isLoading = true;
            //   });
            // },
            // onPageFinished: (String url) {
            //   setState(() {
            //     _isLoading = false;
            //   });
            // },
          ),
          // if (_isLoading)
          //   Center(
          //     child: CircularProgressIndicator(),
          //   ),
        ],
      ),
    );
  }
}
