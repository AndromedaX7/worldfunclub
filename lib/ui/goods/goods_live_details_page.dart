import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/goods_live_details_page_provider.dart';
class GoodsLiveDetailsPage
    extends ProviderWidget<GoodsLiveDetailsPageProvider> {

  GoodsLiveDetailsPage() : super();

  @override
  Widget buildContent(BuildContext context,
      GoodsLiveDetailsPageProvider provider) {
    return _GoodsLiveDetailsPageContent(provider);
  }
}

class _GoodsLiveDetailsPageContent extends StatefulWidget {
  final GoodsLiveDetailsPageProvider provider;

  _GoodsLiveDetailsPageContent(this.provider);

  @override
  _GoodsLiveDetailsPageContentState createState() =>
      _GoodsLiveDetailsPageContentState();
}

class _GoodsLiveDetailsPageContentState
    extends State<_GoodsLiveDetailsPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
