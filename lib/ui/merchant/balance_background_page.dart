import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/balance_background_page_provider.dart';

class BalanceBackgroundPage
    extends ProviderWidget<BalanceBackgroundPageProvider> {

  BalanceBackgroundPage() : super();

  @override
  Widget buildContent(BuildContext context,
      BalanceBackgroundPageProvider provider) {
    return _BalanceBackgroundPageContent(provider);
  }
}

class _BalanceBackgroundPageContent extends StatefulWidget {
  final BalanceBackgroundPageProvider provider;

  _BalanceBackgroundPageContent(this.provider);

  @override
  _BalanceBackgroundPageContentState createState() =>
      _BalanceBackgroundPageContentState();
}

class _BalanceBackgroundPageContentState
    extends State<_BalanceBackgroundPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商家管理"),
        actions: [
          IconButton(icon: Icon(Icons.qr_code), onPressed: (){}),
          IconButton(icon: Icon(Icons.wallet_travel), onPressed: (){}),
        ],
      ),
    );
  }
}
