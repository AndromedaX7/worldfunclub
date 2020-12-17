import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_vip_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyVipPage extends ProviderWidget<MyVipPageProvider> {

  MyVipPage() : super();

  @override
  Widget buildContent(BuildContext context, MyVipPageProvider provider) {
    return _MyVipPageContent(provider);
  }
}

class _MyVipPageContent extends StatefulWidget {
  final MyVipPageProvider provider;

  _MyVipPageContent(this.provider);

  @override
  _MyVipPageContentState createState() => _MyVipPageContentState();
}

class _MyVipPageContentState extends State<_MyVipPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的会员"),
        brightness: Brightness.dark,
      ),
      body: ListWrapper(),
    );
  }
}
