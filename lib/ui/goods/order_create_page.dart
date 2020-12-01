import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/order_create_page_provider.dart';

class OrderCreatePage extends ProviderWidget<OrderCreatePageProvider> {

  OrderCreatePage() : super();

  @override
  Widget buildContent(BuildContext context, OrderCreatePageProvider provider) {
    return _OrderCreatePageContent(provider);
  }
}

class _OrderCreatePageContent extends StatefulWidget {
  final OrderCreatePageProvider provider;

  _OrderCreatePageContent(this.provider);

  @override
  _OrderCreatePageContentState createState() => _OrderCreatePageContentState();
}

class _OrderCreatePageContentState extends State<_OrderCreatePageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("确认订单"),),
    );
  }
}
