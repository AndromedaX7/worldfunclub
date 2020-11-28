import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeAdvertPage extends StatelessWidget {
  final String _id;
  final String _sign;
  final String _name;

  HomeAdvertPage(this._id, this._sign, this._name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: InAppWebView(
        initialUrl:
            "http://shop.tule-live.com/index.php/api/Activity/product_list/activity_id/${_id}/activity_sign/${_sign}",
      ),
    );
  }
}
