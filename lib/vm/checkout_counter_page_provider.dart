import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/bean/pay.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/pay_success_page.dart';

class CheckoutCounterPageProvider extends BaseProvider {
  final OrderData data;
  final GoodsType goodsType;

  CheckoutCounterPageProvider(this.data, this.goodsType);

  void orderAuth(BuildContext context, int payPrefix, ) {
    api.orderAuth(payPrefix, data.order_id).listen((e) {
      var resp = PayResp.fromJson(e);
      if (resp.code == 1) {
        if (payPrefix == 20) {
          resp.data["orderId"] = data.order_id;
          resp.data["goodsType"] = "${goodsType.value}";
          resp.data["payMoney"] = data.total_price;
          LocalChannel.wechatPay(resp.data);
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (builder) =>
                  PaySuccessPage(data.order_id, goodsType.value, data.total_price)));
        }
      }
    });
  }
}
