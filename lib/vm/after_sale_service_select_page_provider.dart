import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class AfterSaleServiceSelectPageProvider extends BaseProvider {
  final OrderGoods goods;

  AfterSaleServiceSelectPageProvider(this.goods);

  List<String> _refundReason = [];

  List<String> get refundReason => _refundReason;

  List<File> _images = [];

  List<File> get images => _images;

  set images(List<File> ll) {
    _images = ll;
    notifyListeners();
  }

  void addImages(File path) {
    _images.add(path);
    notifyListeners();
  }

  set refundReason(List<String> r) {
    _refundReason = r;
    notifyListeners();
  }

  void loadRefundReason() {
    api.refundReason().listen((event) {
      var resp = RefundReasonResp.fromJson(event);
      if (resp.code == 1) {
        refundReason = resp.data.refundReason;
      }
    });
  }

  void refund(BuildContext context, bool show, String reason,
      double refundPrice, String remark) {
    showDialog(context: context,builder: (c)=>AlertDialog(
      title: Text("请稍候"),
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 16.w,),
          Text("正在上传您的售后申请")
        ],
      ),
    ),barrierDismissible: false);
    api
        .refundApply(
            goods.orderGoodsId, show, reason, refundPrice, images, remark)
        .listen((event) {
          Navigator.pop(context);
      var resp = EmptyDataResp.fromJson(event);
      Fluttertoast.showToast(msg: resp.code == 1 ? event["data"] : resp.msg);
      if (resp.code == 1) {
        Navigator.of(context).pop();
      }
    });
  }
}
