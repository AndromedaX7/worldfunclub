import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/main.dart' as main;
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

class BindPhonePageProvider extends BaseProvider {
  String _phone = "";
  String _code = "";
  String _errorText;

  final LocalCache _lc;
  final MainUiProvider _uiProvider;

  BindPhonePageProvider(this._lc, this._uiProvider);

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
      api.sendCodeForBindPhone(_phone).listen((event) {
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

  void bindPhone(BuildContext context) {
    api.bindPhone(_phone, _code).listen((event) {
      var bean = EmptyDataResp.fromJson(event);
      if (bean.code == 1) {
        _lc.writeUserInfoWithPhone(main.userId, main.nickName, main.avatar,
            main.token, main.userType, true, _phone);
        _lc.restoreUserInfoWithPhone();
        Fluttertoast.showToast(msg: "绑定成功");
        Navigator.of(context).pop();
        _uiProvider.state = MainState.MAIN;
      } else {
        Fluttertoast.showToast(msg: bean.msg);
      }
    });
  }
}
