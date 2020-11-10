import 'package:flutter/services.dart';

class LocalChannel {
  static const MethodChannel _channel =
      const MethodChannel("com.ds.worldfunclub.local");
  static const kWechatCodeResponse = "wechatCodeResponse";
  static const kLoginWithWechat = "loginWithWechat";

  static bool bind=false;
  static  List <LocalChannelResponse> cacher=List();
  static void listener(LocalChannelResponse resp) {
    cacher.add(resp);
    if(!bind){
      _channel.setMethodCallHandler((call) {
        switch (call.method) {
          case kWechatCodeResponse:
            cacher.forEach((r) { r.wechatCode(call.arguments); });
            return null;
          default:
            return null;
        }
      });
      bind=true;
    }
  }

  static void loginWithWechat() async {
    await _channel.invokeMethod(kLoginWithWechat);
  }
}

abstract class LocalChannelResponse {
  void wechatCode(String code);
}
