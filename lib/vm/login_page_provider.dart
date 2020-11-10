import 'package:worldfunclub/bean/login_info.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';
import 'package:worldfunclub/widgets/local_platform_channel.dart';

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
        if (data.user_mobilebind == "1") {
          _lc.writeUserInfo(data.user_id, data.nickname, data.avatar,
              data.login_token, data.user_type, data.user_mobilebind == "1");
          _lc.restoreUserInfo();
          _mainUiProvider.state=MainState.MAIN;
        } else {}
      }
    });
  }
}
