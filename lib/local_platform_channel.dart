import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/ui/order/order_list_page.dart';
import 'package:worldfunclub/ui/pay_success_page.dart';
import 'package:worldfunclub/utils/log.dart';

class LocalChannel {
  static const MethodChannel _channel =
      const MethodChannel("com.ds.worldfunclub.local");
  static const kWechatCodeResponse = "wechatCodeResponse";
  static const kLoginWithWechat = "loginWithWechat";
  static const kStartRouteActivity = "startRouteActivity";
  static bool bind = false;
  static List<LocalChannelResponse> cacher = List();

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
          case "payFailed":
            return null;
          case "paySuccess":
            var map = call.arguments;
            Log.e(map["pay"]);
            App.navigatorKey.currentState.push(MaterialPageRoute(
                builder: (builder) => PaySuccessPage(map["orderId"].toString(),
                    map["orderType"].toString(), map["pay"].toString())));
            return null;
          case "openOrderList":
            var map = call.arguments;
            String orderType =map["orderType"]  ;
            while(App.navigatorKey.currentState.canPop()){
              App.navigatorKey.currentState.pop();
            }
            App.navigatorKey.currentState.push(MaterialPageRoute(
                builder: (builder) => OrderListPage(

                  goodsType: orderType == "1"
                      ? GoodsType.self
                      : GoodsType.live,
                  state: orderType == "1" ? 1 : 0,
                )));
            return null;
          case "openHome":
            while(App.navigatorKey.currentState.canPop()){
              App.navigatorKey.currentState.pop();
            }
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

  static void startRouteActivity(String route, Map<String, String> args) {
    _channel.invokeMethod(kStartRouteActivity,
        {"route": route, "args": args, "userId": userId, "token": token});
  }

  static void wechatPay(dynamic map){
    _channel.invokeMethod("wechatPay",map);
  }
}

abstract class LocalChannelResponse {
  void wechatCode(String code);
}
