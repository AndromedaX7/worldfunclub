import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/mine/after_sale_sevice_select_page.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class OrderCategoryPageProvider extends BaseProvider with LoadMoreMixin {
  final int state;
  final GoodsType goodsType;

  OrderCategoryPageProvider(this.state, this.goodsType);

  List<OrderData> _orders = [];

  List<OrderData> get orders => _orders;

  set orders(List<OrderData> data) {
    _orders.addAll(data);
    notifyListeners();
  }

  void loadOrderItem({bool clearData = false}) {
    loadMore(clearData: clearData);
  }

  @override
  void loadMore({bool clearData = false}) {
    if (clearData) {
      page = 0;
    }
    super.loadMore(clearData: clearData);
    api
        .orderList(
            page,
            goodsType == GoodsType.self
                ? OrderType.fromIndex(state)
                : OrderType.fromLive(state),
            goodsType)
        .listen((event) {
      var list = OrderList.fromJson(event);
      canload = list.code == 1;
      if (list.code == 1) {
        if (clearData) {
          orders.clear();
        }
        orders = list.data;
        canload = list.data.isNotEmpty;
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
