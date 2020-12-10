import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:worldfunclub/http/http.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/utils/log.dart';

/// js 调用 flutter xxx：flutter 注册实现的函数
/// window.flutter_inappwebview.callHandler('xxx').then(function(result) {
///        console.log(result);
///      });
class HomeAdvertPage extends StatefulWidget {
  final String _id;
  final String _sign;

  HomeAdvertPage(this._id, this._sign, String _name);

  @override
  _HomeAdvertPageState createState() => _HomeAdvertPageState();
}

class _HomeAdvertPageState extends State<HomeAdvertPage> {
  InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SafeArea(
          top: false,
          child: InAppWebView(
            onWebViewCreated: (w) {
              _controller = w;
              _controller.addJavaScriptHandler(
                  handlerName: "goBack",
                  callback: (e) {
                    Navigator.of(context).pop();
                    return;
                  });
              _controller.addJavaScriptHandler(
                  handlerName: "jumpLogin",
                  callback: (e) {
                    callPop();
                    return;
                  });
            },
            shouldOverrideUrlLoading: (InAppWebViewController controller,
                ShouldOverrideUrlLoadingRequest
                    shouldOverrideUrlLoadingRequest) async {
              if (!shouldOverrideUrlLoadingRequest.url.startsWith("http")) {
                LocalChannel.startActivityWithUrl(
                    shouldOverrideUrlLoadingRequest.url);
              }
              Log.d(shouldOverrideUrlLoadingRequest.url);
              return ShouldOverrideUrlLoadingAction.ALLOW;
            },
            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              debuggingEnabled: false,
              javaScriptEnabled: true,
            )),
            initialUrl:
                "http://shop.tule-live.com/index.php/api/Activity/product_list/activity_id/${widget._id}/activity_sign/${widget._sign}/user_id/$userId",
          ),
        ),
      ),
    );
  }
}
