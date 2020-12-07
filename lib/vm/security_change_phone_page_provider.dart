import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/settings.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';

class SecurityChangePhonePageProvider extends BaseProvider{

  final LocalCache _localCache;
  SecurityChangePhonePageProvider(this._localCache);
  String phone ="";
  String code ="";

  void sendChangePhoneAuthCode() {
    api.sendChangePhoneAuthCode(phone).listen((event) {
      Fluttertoast.showToast(msg: EmptyDataResp.fromJson(event).msg);
    });
  }
  void confirmChange(BuildContext context) {
    if ( phone.isNotEmpty &&  code.isNotEmpty)
    api.changePhone(phone, code).listen((event) {
      var resp =ChangePhoneResp.fromJson(event);
      if(resp.code == 1){
        mobile =resp.data.mobile;
        _localCache.writeCurrent();
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(msg: resp.msg);
    });
  }
}