import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webviewpopupauth/popupauth.dart';
class GoodsDetailsPage extends StatefulWidget {
  final bool self ;
  GoodsDetailsPage({this.self});

  @override
  _GoodsDetailsPageState createState() => _GoodsDetailsPageState();
}

class _GoodsDetailsPageState extends State<GoodsDetailsPage> {

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) WebView.platform=SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(icon: Icon(Icons.web) ,onPressed: (){ /*showOpenPanel(url: "https://www.bilibili.com");*/},)
      ],),
      body: WebView(initialUrl: "https://www.bilibili.com",),
    );
  }
}
