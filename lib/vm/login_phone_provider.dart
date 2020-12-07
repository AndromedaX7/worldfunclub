import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/login_info.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

class LoginPhonePageProvider extends BaseProvider {
  String _phone = "";
  String _code = "";
  String _errorText;

  final LocalCache _lc;
  final MainUiProvider _uiProvider;
  LoginPhonePageProvider(this._lc,this._uiProvider);

  set errorText(String err) {
    _errorText = err;
    notifyListeners();
  }

  String get errorText => _errorText;

  void phone(String s) {
    _phone = s;
    errorText = errorPhone();
  }

  void code(String s) {
    _code = s;
  }

  String errorPhone() {
    if (isEmpty(_phone)) {
      return "请输入手机号";
    } else if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(_phone)) {
      return "手机号格式不正确";
    }
    return null;
  }

  void sendCode() {
    var err = errorPhone();
    if (err == null) {
      api.sendAuthCodeWithLogin(_phone).listen((event) {
        var bean = EmptyDataResp.fromJson(event);
        if (bean.code == 1) {
          Fluttertoast.showToast(msg: bean.msg);
        } else {
          Fluttertoast.showToast(msg: bean.msg);
        }
      });
    } else {
      Fluttertoast.showToast(msg: err);
    }
  }

  void login(BuildContext context) {
    api.login(_phone, _code).listen((event) {
      var bean = LoginBean.fromJson(event);
      if (bean.code == 1) {
        var data = bean.data;
        if(data.hasBindMobilePhone == "1"){
          _lc.writeUserInfoWithPhone(data.userId, data.nickname, data.avatar,
              data.token, data.userType, data.hasBindMobilePhone == "1",data.mobileNumber);
          _lc.restoreUserInfoWithPhone();
          Navigator.of(context).pop();
          _uiProvider.state = MainState.MAIN;
        }else {
          _lc.writeUserInfo(data.userId, data.nickname, data.avatar,
              data.token, data.userType, data.hasBindMobilePhone == "1");
          _lc.restoreUserInfoWithPhone();
          Navigator.of(context).pop();
          _uiProvider.state = MainState.MAIN;


        }
      } else {
        Fluttertoast.showToast(msg: bean.msg);
      }
    });
  }
}
