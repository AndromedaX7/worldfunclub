import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/security_change_phone_page_provider.dart';

class SecurityChangePhonePage
    extends ProviderWidget<SecurityChangePhonePageProvider> {

  SecurityChangePhonePage() : super();

  @override
  Widget buildContent(BuildContext context,
      SecurityChangePhonePageProvider provider) {
    return _SecurityChangePhonePageContent(provider);
  }
}

class _SecurityChangePhonePageContent extends StatefulWidget {
  final SecurityChangePhonePageProvider provider;

  _SecurityChangePhonePageContent(this.provider);

  @override
  _SecurityChangePhonePageContentState createState() =>
      _SecurityChangePhonePageContentState();
}

class _SecurityChangePhonePageContentState
    extends State<_SecurityChangePhonePageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
