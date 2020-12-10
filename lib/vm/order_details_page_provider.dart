import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/mine/after_sale_sevice_select_page.dart';

class OrderDetailsPageProvider extends BaseProvider {
  final OrderData data;
  final GoodsType type;

  OrderDetailsPageProvider(this.data, this.type);

  OrderDetailsData _orderRemote=OrderDetailsData();

  OrderDetailsData get orderRemote => _orderRemote;

  set orderRemote(OrderDetailsData input) {
    this._orderRemote = input;
    notifyListeners();
  }

  void orderDetails() {
    api.orderDetails(data.order_id).listen((event) {
      var resp = OrderDetailsResp.fromJson(event);
      if (resp.code == 1) {
        orderRemote = resp.data;
      }
    });
  }


  void afterSale(BuildContext context, OrderData data, OrderGoods goods) async {
    api.checkCouldAfterSale(goods.order_goods_id).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if (resp.code == 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => AfterSaleServiceSelectPage(goods)));
      } else {
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }
}
