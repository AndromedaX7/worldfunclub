import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class UserProtocolPage extends StatelessWidget {

  final String title;
  final String protocolAddress;
  UserProtocolPage(this.title,{this.protocolAddress=""});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),brightness: Brightness.dark,),
      body: ListWrapper(
        data: protocolAddress.isEmpty||!protocolAddress.startsWith("http")?[]:[0],
        child: InAppWebView(
          initialUrl: protocolAddress,
        ),
      ),
    );
  }
}
