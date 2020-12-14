import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/ui/merchant/write_off_page.dart';
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
  static List<LocalChannelResponse> cache = [];

  static void listener(LocalChannelResponse resp) {
    cache.add(resp);
    if (!bind) {
      _channel.setMethodCallHandler((call) {
        switch (call.method) {
          case kWechatCodeResponse:
            cache.forEach((r) {
              r.wechatCode(call.arguments);
            });
            return null;
          case "payFailed":
            return null;
          case "paySuccess":
            var map = call.arguments;
            Log.e(map["pay"]);
            App.navigatorKey.currentState.push(MaterialPageRoute(
                builder: (builder) =>
                    PaySuccessPage(map["orderId"].toString(),
                        map["orderType"].toString(), map["pay"].toString())));
            return null;
          case "openOrderList":
            var map = call.arguments;
            String orderType = map["orderType"];
            while (App.navigatorKey.currentState.canPop()) {
              App.navigatorKey.currentState.pop();
            }
            App.navigatorKey.currentState.push(MaterialPageRoute(
                builder: (builder) =>
                    OrderListPage(

                      goodsType: orderType == "1"
                          ? GoodsType.self
                          : GoodsType.live,
                      state: orderType == "1" ? 1 : 0,
                    )));
            return null;
          case "openHome":
            while (App.navigatorKey.currentState.canPop()) {
              App.navigatorKey.currentState.pop();
            }
            return null;
          case "scanResult":
            Navigator.of(App.navigatorKey.currentContext).push(
                MaterialPageRoute(builder: (builder) => WriteOffPage(call.arguments.toString())));
            // launchWriteOff();
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

  @Deprecated("近期移除")
  static void startActivityByClass(String className, Map<String, String> args) {
    _channel.invokeMethod("startActivityByClass",
        {
          "className": className,
          "args": args,
          "userId": userId,
          "token": token
        });
  }

  static void startActivityWithUrl(String url) {
    _channel.invokeMethod("startActivityWithUrl", url);
  }

  static void callPhone(String phone) async {
    if (await Permission.phone.isGranted)
      _channel.invokeMethod("callPhone", phone);
    else {
      await Permission.phone.request().isGranted.then((value) {
        if(value){
          _channel.invokeMethod("callPhone", phone);
        }
      });
    }
  }

  static void wechatPay(dynamic map) {
    _channel.invokeMethod("wechatPay", map);
  }

  static void startScan() {
    _channel.invokeMethod("scan");
  }

  static void openLocation(double lat, double lon, String name) {
    _channel.invokeMethod(
        "openLocation", {"lat": lat, "lon": lon, "name": name});
  }
}

abstract class LocalChannelResponse {
  void wechatCode(String code);
}
