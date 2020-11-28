import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/goods_search_page_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class GoodsSearchPage extends ProviderWidget<GoodsSearchPageProvider> {
  final GlobalKey<GoodsSearchPageContentState> opKey;

  GoodsSearchPage(String query, GoodsType type, this.opKey)
      : super(params: [query, type]);

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _GoodsSearchPageContent(mProvider, key: opKey);
  }
}

class _GoodsSearchPageContent extends StatefulWidget {
  final GoodsSearchPageProvider provider;

  _GoodsSearchPageContent(this.provider, {Key key});

  @override
  GoodsSearchPageContentState createState() => GoodsSearchPageContentState();
}

class GoodsSearchPageContentState extends State<_GoodsSearchPageContent> {
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    widget.provider.queryGoods(clear: true);
    _controller=ScrollController();
    _controller.addListener(() {
      if(_controller.position.maxScrollExtent== _controller.position.pixels){
        if(widget.provider.canload){
          widget.provider.queryGoods();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.5.w),
        child: GridView.builder(controller: _controller,
          itemCount: widget.provider.data.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 170/256),
          itemBuilder: (c, i) => Container(
              margin: EdgeInsets.symmetric(vertical: 4.w,horizontal: 3.5.w),
              child: GoodsItemForSearch(widget.provider.data[i],widget.provider.type)),
        ),
      ),
    );
  }

  void search(String query, GoodsType type) {
    widget.provider.search(query, type);
  }
}
