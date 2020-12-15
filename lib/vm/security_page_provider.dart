import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

class SecurityPageProvider extends BaseProvider {
  final LocalCache _lc;
  final MainUiProvider _uiProvider;

  SecurityPageProvider(this._lc, this._uiProvider);

  void logout(BuildContext context) {
    _lc.logout(onlyLogout: true);

    api.destroy().listen((e) {
      var resp = EmptyDataResp.fromJson(e);
      if (resp.code == 1) {
        Fluttertoast.showToast(msg: "账户已注销");
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        _uiProvider.state = MainState.Login;
      } else {
        Fluttertoast.showToast(msg: resp.msg);
      }
    });

  }
}
