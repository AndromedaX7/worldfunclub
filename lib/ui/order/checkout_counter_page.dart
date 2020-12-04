import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/checkout_counter_page_provider.dart';

class CheckoutCounterPage extends ProviderWidget<CheckoutCounterPageProvider> {

  CheckoutCounterPage(OrderData data) : super(params: [data]);

  @override
  Widget buildContent(BuildContext context,
      CheckoutCounterPageProvider provider) {
    return _CheckoutCounterPageContent(provider);
  }
}

class _CheckoutCounterPageContent extends StatefulWidget {
  final CheckoutCounterPageProvider provider;

  _CheckoutCounterPageContent(this.provider);

  @override
  _CheckoutCounterPageContentState createState() =>
      _CheckoutCounterPageContentState();
}

class _CheckoutCounterPageContentState
    extends State<_CheckoutCounterPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("途乐会收银台"),
      ),
    );
  }
}
