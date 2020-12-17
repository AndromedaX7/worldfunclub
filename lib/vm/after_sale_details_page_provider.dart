import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class AfterSaleDetailsPageProvider extends BaseProvider {
  final RefundListData orderRefund;

  String expressId = "";
  String _expressName = "";
  String get  expressName => _expressName;
  set expressName (String s){
    _expressName=s;
    notifyListeners();
  }
  String expressNo = "";
  String phone;

  List<RefundCompanyData> _expressList=[];
  List<RefundCompanyData> get  expressList=>_expressList;
  set expressList(List<RefundCompanyData> ll){
    _expressList=ll;
    notifyListeners();
  }
  final String type;
  RefundDetailsData _data;

  AfterSaleDetailsPageProvider(this.orderRefund, this.type) {
    _data = RefundDetailsData();
  }

  RefundDetailsData get data => _data;

  set data(RefundDetailsData d) {
    _data = d;
    notifyListeners();
  }

  void loadDetails() {
    api.refundDetails(orderRefund.orderRefundId).listen((event) {
      var resp = RefundDetailsResp.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
      }
    });
    if(type =="10"){
      api.companyList().listen((event) {
        var resp = RefundCompanyListResp.fromJson(event);
        if(resp.code ==1){
          expressList=resp.data;
        }
      });
    }
  }

  void commitDelivery(BuildContext context) {
    if (expressId.isEmpty || expressName.isEmpty) {
      Fluttertoast.showToast(msg: "请选择物流公司");
      return;
    }
    if (phone.isEmpty) {
      Fluttertoast.showToast(msg: "请填写联系电话");
      return;
    }
    if (expressNo.isEmpty) {
      Fluttertoast.showToast(msg: "请填写物流单号");
      return;
    }

    api.commitDelivery(
            expressId, expressName, expressNo, phone, orderRefund.orderRefundId)
        .listen((json) {
      var resp = EmptyDataResp.fromJson(json);
      if (resp.code == 1) {
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(msg: resp.msg);
    });
  }
}
