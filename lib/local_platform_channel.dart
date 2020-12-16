import 'package:flutter/material.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/ui/order/order_list_page.dart';
import 'package:worldfunclub/ui/pay_success_page.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclublocal/worldfunclublocal.dart';

class LocalChannel {
  static const kWechatCodeResponse = "wechatCodeResponse";
  static const kLoginWithWechat = "loginWithWechat";
  static const kStartRouteActivity = "startRouteActivity";

  static void listener(LocalChannelResponse resp) {
    Worldfunclublocal.listener(resp, (call) {
      switch (call.method) {
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
        default:
          return null;
      }
    });
  }

  static void loginWithWechat() {
    Worldfunclublocal.loginWithWechat();
  }


  static void startActivityWithUrl(String url) {
    Worldfunclublocal.startActivityWithUrl(url);
  }

  static void callPhone(String phone)   {
    Worldfunclublocal.callPhone(phone);
  }

  static void wechatPay(dynamic map) {
    Worldfunclublocal.wechatPay(map);
  }

  static void startScan() {
    Worldfunclublocal.startScan();
  }

  static void openLocation(double lat, double lon, String name) {
    Worldfunclublocal.openLocation(lat, lon, name);
  }
}

