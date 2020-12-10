import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/bean/pay.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/pay_success_page.dart';

class LiveOrderCommitPageProvider extends BaseProvider {
  final LiveGoodsItemMapping data;
  final String hours;
  final String shopName;

  int _totalCount = 1;

  int get totalCount => _totalCount;

  set totalCount(int i) {
    _totalCount = i;
    notifyListeners();
  }

  void increaseCartNum(
    bool orientation,
  ) {
    if (orientation) {
      if (totalCount >= data.sku.stock_num.integer) {
        return;
      } else {
        totalCount = totalCount + 1;
      }
    } else {
      if (totalCount <= 1) {
        return;
      } else {
        totalCount = totalCount - 1;
      }
    }
  }

  int hour = 0;
  int minute = 0;
  int endHour = 0;
  int endMinute = 0;

  LiveOrderCommitPageProvider(this.shopName, this.hours, this.data) {
    var times = hours.split("-");
    if (times.length > 1) {
      var start = times[0].split(":");
      var end = times[1].split(":");
      hour = start[0].integer;
      minute = start[1].integer;
      endHour = end[0].integer;
      endMinute = end[1].integer;
    }
  }

  void buy(int payType, String name, String phone, String date, String remark,
      void Function(String id) createAlert) {
    if (data.needSubScribe) {
      api
          .liveBuy(
              data.sku.goods_id,
              totalCount,
              data.sku.goods_sku_id,
              "$payType",
              data.sku.goods_price.d * totalCount,
              name,
              phone,
              date,
              remark)
          .listen((e) {
        var resp = OrderCommitResp.fromJson(e);
        if (resp.code == 1) {
          createAlert(resp.data.orderId);
        } else {
          Fluttertoast.showToast(msg: resp.msg);
        }
      });
    } else {
      api
          .liveBuy(
              data.sku.goods_id,
              totalCount,
              data.sku.goods_sku_id,
              "$payType",
              data.sku.goods_price.d * totalCount,
              name,
              phone,
              "",
              remark)
          .listen((e) {
        var resp = OrderCommitResp.fromJson(e);
        if (resp.code == 1) {
          createAlert(resp.data.orderId);
        } else {
          Fluttertoast.showToast(msg: resp.msg);
        }
      });
    }
  }

  void orderAuth(BuildContext context, int payPrefix, String oid) {
    api.orderAuth(payPrefix, oid).listen((e) {
      var resp =PayResp.fromJson(e);
      if(resp.code == 1){
        if(payPrefix ==20){
          resp.data["orderId"]=oid;
          resp.data["goodsType"]="2";
          resp.data["payMoney"]=(data.sku.goods_price.d * totalCount).toStringAsFixed(2);
          LocalChannel.wechatPay(resp.data);
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>PaySuccessPage(oid, "2", (data.sku.goods_price.d * totalCount).toStringAsFixed(2))));
        }
      }
    });
  }
}
