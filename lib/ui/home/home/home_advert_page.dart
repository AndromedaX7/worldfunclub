import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/active_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/home_advert_page_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeAdvertPage extends ProviderWidget<HomeAdvertPageProvider> {
  HomeAdvertPage(String _id, String _sign, String _name)
      : super(params: [_id, _sign, _name]);

  @override
  Widget buildContent(BuildContext context) {
    return _HomeAdvertPageContent(mProvider);
  }
}

class _HomeAdvertPageContent extends StatefulWidget {
  final HomeAdvertPageProvider provider;

  _HomeAdvertPageContent(this.provider);

  @override
  _HomeAdvertPageContentState createState() => _HomeAdvertPageContentState();
}

class _HomeAdvertPageContentState extends State<_HomeAdvertPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.provider.name),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.provider.goods.length,
          itemBuilder: ,
        ),
      ),
    );
  }
  Widget _buildGoodsItem(ActiveGoods goods){
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Text(goods.itemTitle),
    )
  }
}
