import 'package:flutter/services.dart';
import 'package:worldfunclub/main.dart';

class LocalChannel {
  static const MethodChannel _channel =
  const MethodChannel("com.ds.worldfunclub.local");
  static const kWechatCodeResponse = "wechatCodeResponse";
  static const kLoginWithWechat = "loginWithWechat";
  static const kStartRouteActivity = "startRouteActivity";
  static bool bind = false;
  static List <LocalChannelResponse> cacher = List();

  static void listener(LocalChannelResponse resp) {
    cacher.add(resp);
    if (!bind) {
      _channel.setMethodCallHandler((call) {
        switch (call.method) {
          case kWechatCodeResponse:
            cacher.forEach((r) {
              r.wechatCode(call.arguments);
            });
            return null;
          default:
            return null;
        }
      });
      bind = true;
    }
  }

  static void loginWithWechat() async {
    await _channel.invokeMethod(kLoginWithWechat);
  }

  static void startRouteActivity(String route, Map<String,String> args) {
    _channel.invokeMethod(kStartRouteActivity, {"route": route, "args": args,"userId":userId,"token":loginToken});
  }
}

abstract class LocalChannelResponse {
  void wechatCode(String code);
}
