import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeAdvertPage extends StatefulWidget {
  final String _id;
  final String _sign;
  final String _name;

  HomeAdvertPage(this._id, this._sign, this._name);

  @override
  _HomeAdvertPageState createState() => _HomeAdvertPageState();
}

class _HomeAdvertPageState extends State<HomeAdvertPage> {
  InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(await _controller.canGoBack()){
          _controller.goBack();
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: InAppWebView(
          onWebViewCreated: (w){
            _controller=w;
          },
          initialUrl:
              "http://shop.tule-live.com/index.php/api/Activity/product_list/activity_id/${widget._id}/activity_sign/${widget._sign}",
        ),
      ),
    );
  }
}
