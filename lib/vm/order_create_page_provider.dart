import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/bean/pay.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/ui/pay_success_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderCreatePageProvider extends BaseProvider {

  List<String> carts = [];
  final List<GoodsListBean> goods;
  final bool  cart;
  OrderCreatePageProvider(this.goods,this.cart){
    double pp=0;
    goods.forEach((element) {
      carts.add(element.cartId);
      pp += (element.totalNum.integer * element.goodsPrice.d);
    });
    price=pp;
  }

  AddressData _data;

  AddressData get data => _data;

  set data(AddressData d) {
    _data = d;
    notifyListeners();
  }


  double _price;

  double  get price => _price;

  set price(double d) {
    _price = d;
    notifyListeners();
  }


  void loadDefaultAddress() {
    api.defaultAddress().listen((event) {
      var resp = DefaultAddress.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
      }
    });
  }


  void commit(BuildContext context,String remark,int payType,void Function (String oid) createAlert){
    showDialog(context: context,builder: (c)=>AlertDialog(
      title: Text("请稍候"),
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 16.w,),
          Text("正在生成您的订单")
        ],
      ),
    ),barrierDismissible: false);
    if(cart){
      api.buyCart(carts,price, data.addressId, remark, payType).listen((event) {
        Navigator.of(context).pop();
        var resp = OrderCommitResp.fromJson(event);
        if (resp.code == 1) {
          createAlert(resp.data.orderId);
        } else {
          Fluttertoast.showToast(msg: resp.msg);
        }
      });
    }else{
      api.buyNow(goods[0],  data.addressId, remark, payType).listen((event) {
        Navigator.of(context).pop();
        var resp = OrderCommitResp.fromJson(event);
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
          resp.data["goodsType"]="1";
          resp.data["payMoney"]=(price).toStringAsFixed(2);
          LocalChannel.wechatPay(resp.data);
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>PaySuccessPage(oid, "1", price.toStringAsFixed(2))));
        }
      }
    });
  }

}
