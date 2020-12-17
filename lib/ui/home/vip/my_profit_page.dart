import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_profit_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyProfitPage extends ProviderWidget<MyProfitPageProvider> {

  MyProfitPage() : super();

  @override
  Widget buildContent(BuildContext context, MyProfitPageProvider provider) {
    return _MyProfitPageContent(provider);
  }
}

class _MyProfitPageContent extends StatefulWidget {
  final MyProfitPageProvider provider;

  _MyProfitPageContent(this.provider);

  @override
  _MyProfitPageContentState createState() => _MyProfitPageContentState();
}

class _MyProfitPageContentState extends State<_MyProfitPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收益"),
        brightness: Brightness.dark,
      ),
      body: ListWrapper(),
    );
  }
}
