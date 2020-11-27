import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/after_sale_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class AfterSalePage extends ProviderWidget<AfterSalePageProvider> {

  AfterSalePage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _AfterSalePageContent(mProvider);
  }
}

class _AfterSalePageContent extends StatefulWidget {
  final AfterSalePageProvider provider;

  _AfterSalePageContent(this.provider);

  @override
  _AfterSalePageContentState createState() => _AfterSalePageContentState();
}

class _AfterSalePageContentState extends State<_AfterSalePageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("售后记录"),),
      body: ListWrapper(),
    );
  }
}
