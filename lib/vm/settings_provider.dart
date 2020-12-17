import 'package:flutter/cupertino.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

class SettingsPageProvider extends BaseProvider {
  final LocalCache _lc;
  final MainUiProvider _uiProvider;
  SettingsPageProvider(this._lc,this._uiProvider);

  void logout(BuildContext context) {
    _lc.logout( );
    Navigator.of(context).pop();
    _uiProvider.state=MainState.Login;
  }

}
