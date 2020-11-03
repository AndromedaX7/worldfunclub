import 'package:flutter/material.dart';
// import 'package:webviewpopupauth/popupauth.dart';
class GoodsDetailsPage extends StatefulWidget {
  @override
  _GoodsDetailsPageState createState() => _GoodsDetailsPageState();
}

class _GoodsDetailsPageState extends State<GoodsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(icon: Icon(Icons.web) ,onPressed: (){ /*showOpenPanel(url: "https://www.bilibili.com");*/},)
      ],),

    );
  }
}
