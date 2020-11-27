import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_coupon_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyCouponPage extends ProviderWidget<MyCouponPageProvider> {

  MyCouponPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _MyCouponPageContent(mProvider);
  }
}

class _MyCouponPageContent extends StatefulWidget {
  final MyCouponPageProvider provider;

  _MyCouponPageContent(this.provider);

  @override
  _MyCouponPageContentState createState() => _MyCouponPageContentState();
}

class _MyCouponPageContentState extends State<_MyCouponPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的优惠券"),),
      body: ListWrapper(),
    );
  }
}
