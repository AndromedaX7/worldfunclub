import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class AddBankCardPageProvider extends BaseProvider {
  String _userName = "";
  String _cardCode = "";
  String _phone = "";
  String _bankName = "";
  String _openName = "";

  String get userName => _userName;

  String get cardCode => _cardCode;

  String get phone => _phone;

  String get bankName => _bankName;

  String get openName => _openName;

  set userName(String str) {
    _userName = str;
    notifyListeners();
  }

  set cardCode(String str) {
    _cardCode = str;
    notifyListeners();
  }

  set phone(String str) {
    _phone = str;
    notifyListeners();
  }

  set bankName(String str) {
    _bankName = str;
    notifyListeners();
  }

  set openName(String str) {
    _openName = str;
    notifyListeners();
  }

  void addBankCard(BuildContext context){
    api.addBankCard(bankName, cardCode, openName, userName, phone).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if(resp.code ==1){
        Navigator.of(context).pop(true);
        Fluttertoast.showToast(msg: "添加成功");
      }else{
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }
}
