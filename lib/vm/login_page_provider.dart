import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/login_info.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/login/bind_phone_page.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';
import 'package:worldfunclub/local_platform_channel.dart';

class LoginPageProvider extends BaseProvider with LocalChannelResponse {
  final LocalCache _lc;
  final MainUiProvider _mainUiProvider;
  final Api _api;

  LoginPageProvider(this._lc,  this._mainUiProvider, this._api);

  void loginWechat() {
    LocalChannel.listener(this);
    LocalChannel.loginWithWechat();
  }

  void loginPhone() {}

  @override
  void wechatCode(String code) {
    _api.loginWithWechat(code).listen((event) {
      var bean = LoginBean.fromJson(event);
      if (bean.code == 1) {
        var data = bean.data;
        if (data.hasBindMobilePhone == "1") {
          _lc.writeUserInfoWithPhone(data.userId, data.nickname, data.avatar,
              data.token, data.userType, data.hasBindMobilePhone == "1",data.mobileNumber);
          _lc.restoreUserInfoWithPhone();
          _mainUiProvider.state=MainState.MAIN;
        } else {
          App.navigatorKey.currentState.push(MaterialPageRoute(builder: (builder)=>BindPhonePage()));
        }
      }
    });
  }
}
