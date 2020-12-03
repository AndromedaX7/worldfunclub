import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/design.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/home_page.dart';
import 'package:worldfunclub/ui/login/login_page.dart';
import 'package:worldfunclub/ui/login/login_phone_page.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

import '../design.dart';

class MainUi extends ProviderWidget<MainUiProvider> {
  MainUi() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    initDefaultDesignSize(context);
    return _MainUiContent(mProvider);
  }
}

class _MainUiContent extends StatefulWidget {
  final MainUiProvider provider;

  _MainUiContent(this.provider);

  @override
  _MainUiContentState createState() => _MainUiContentState();
}

class _MainUiContentState extends State<_MainUiContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return _home();
  }

  Widget _home() {
    switch (widget.provider.state) {
      case MainState.MAIN:
        return HomePage();
        break;
      case MainState.Login:
        return LoginPage();
        break;
      case MainState.Phone:
        return LoginPhonePage();
        break;
    }
    return Container();
  }
}
