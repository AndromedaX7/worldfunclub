import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/banner_page.dart';
import 'package:worldfunclub/vm/live_category_page_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LiveCategoryPage extends ProviderWidget<LiveCategoryPageProvider> {
  LiveCategoryPage(HomeCategoryData data) : super(params: [data]);

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _LiveCategoryPageContent(mProvider);
  }
}

class _LiveCategoryPageContent extends StatefulWidget {
  final LiveCategoryPageProvider provider;

  _LiveCategoryPageContent(this.provider);

  @override
  _LiveCategoryPageContentState createState() =>
      _LiveCategoryPageContentState();
}

class _LiveCategoryPageContentState extends State<_LiveCategoryPageContent> {
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    widget.provider.categoryGoods();
    widget.provider.loadGoodsWithPager(clearData: true);
    _controller=ScrollController();
    _controller.addListener(() {
      if(_controller.position.maxScrollExtent == _controller.position.pixels){
        if(widget.provider.canload){
          widget.provider.loadGoodsWithPager();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView( controller: _controller,
      slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            sliver: SliverToBoxAdapter(
              child: BannerPage(
                 double.infinity,
                 130.w,widget.provider.bannerList,
                self: false,
              ),
            ),
          ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.5),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 179 / 257,
            children: buildGoods(),
          ),
        ),
      ],
    );
  }

  Widget buildDpjxList(HomeCategoryGoods goods) {
    return HomeCategoryGoodsItem(goods);
  }

  List<LiveGoodsItem> buildGoods() {
    return widget.provider.goods.map((e) => LiveGoodsItem(e)).toList();
  }
}
