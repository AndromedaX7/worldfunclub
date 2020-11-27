import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_collection_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyCollectionPage extends ProviderWidget<MyCollectionPageProvider> {
  MyCollectionPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _MyCollectionPageContent(mProvider);
  }
}

class _MyCollectionPageContent extends StatefulWidget {
  final MyCollectionPageProvider provider;

  _MyCollectionPageContent(this.provider);

  @override
  _MyCollectionPageContentState createState() =>
      _MyCollectionPageContentState();
}

class _MyCollectionPageContentState extends State<_MyCollectionPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: ListWrapper(),
    );
  }
}
