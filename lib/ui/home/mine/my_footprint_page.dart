import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_footprint_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyFootprintPage extends ProviderWidget<MyFootprintPageProvider> {

  MyFootprintPage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _MyFootprintPageContent(mProvider);
  }
}

class _MyFootprintPageContent extends StatefulWidget {
  final MyFootprintPageProvider provider;

  _MyFootprintPageContent(this.provider);

  @override
  _MyFootprintPageContentState createState() => _MyFootprintPageContentState();
}

class _MyFootprintPageContentState extends State<_MyFootprintPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的足迹"),
      ),
      body: ListWrapper(),
    );
  }
}
