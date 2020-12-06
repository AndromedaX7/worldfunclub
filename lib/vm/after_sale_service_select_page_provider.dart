import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/utils/log.dart';

class AfterSaleServiceSelectPageProvider extends BaseProvider {
  final OrderGoods goods;

  AfterSaleServiceSelectPageProvider(this.goods);

  List<String> _refundReason = [];

  List<String> get refundReason => _refundReason;

  set refundReason(List<String> r) {
    _refundReason = r;
    notifyListeners();
  }

  void loadRefundReason() {
    api.refundReason().listen((event) {
      var resp = RefundReasonResp.fromJson(event);
      if (resp.code == 1) {
        refundReason = resp.data.refund_reason;
      }
    });
  }

  void refund(BuildContext context,bool show,String reason,double refundPrice) {
    api.refundApply(goods.order_goods_id, show, reason, refundPrice).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      Fluttertoast.showToast(msg:resp.code == 1?event["data"]: resp.msg);
      if(resp.code == 1){
        Navigator.of(context).pop();
      }
    });
  }
}
