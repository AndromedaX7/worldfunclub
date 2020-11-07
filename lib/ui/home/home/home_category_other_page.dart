import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/banner_page.dart';
import 'package:worldfunclub/vm/home_category_other_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class HomeCategoryOtherPage
    extends ProviderWidget<HomeCategoryOtherPageProvider> {

  final HomeCategoryData data;

  HomeCategoryOtherPage(this.data)    : super(params: [data]);

  @override
  Widget buildContent(BuildContext context) {
    return _HomeCategoryOtherPageContent(mProvider);
  }
}

class _HomeCategoryOtherPageContent extends StatefulWidget {
  final HomeCategoryOtherPageProvider provider;

  _HomeCategoryOtherPageContent(this.provider);

  @override
  _HomeCategoryOtherPageContentState createState() =>
      _HomeCategoryOtherPageContentState();
}

class _HomeCategoryOtherPageContentState
    extends State<_HomeCategoryOtherPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.banner();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (widget.provider.bannerTop.length > 0)
          SliverToBoxAdapter(
            child: BannerPage(double.infinity,130.w,widget.provider.bannerTop),
          ),
        SliverPadding(
          sliver: SliverGrid.count(
            children: _category(),
            crossAxisCount: 5,
          ),
          padding: EdgeInsets.only(top: 8.w),
        ),
        if (widget.provider.bannerContent.length > 0 || widget.provider. goods.length > 0)
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 14.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/dpjx.png",
                    width: 5.w,
                    height: 5.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("大牌精选"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Image.asset(
                    "images/dpjx.png",
                    width: 5.w,
                    height: 5.w,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.w))),
              child: Column(
                children: [
                  BannerPage(
                      double.infinity,
                      130.w,widget.provider.bannerContent
                  ),
                  if (widget.provider.goods.length > 0)
                    Container(
                      height: 190.w,
                      child: ListView.builder(
                        itemCount: widget.provider.goods.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (bc, i) => buildDpjxList(widget.provider.goods[i]),
                      ),
                    ),
                ],
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 14.w),
            height: 30.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF354D), Color(0xFFEB602B)],
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.w))),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(buildTodayTuijian()),
        )
      ],
    );
  }

  List<Widget> _category() {
    return List.generate(widget.provider.category.length,
            (index) => _categoryItem(widget.provider.category[index]));
  }

  Widget _categoryItem(HomeCategoryData data) {
    return Container(
      width: 65.w,
      height: 65.w,
      child: Column(
        children: [
          Image.network(
            data.image.file_path,
            width: 50.w,
            height: 50.w,
          ),
          Text(
            data.name,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget buildDpjxList(HomeCategoryGoods goods) {
    return HomeCategoryGoodsItem(goods);
  }
  List<HomeCategoryGoodsItem2> buildTodayTuijian(){
    return widget.provider.goods2.map((e) => HomeCategoryGoodsItem2(e)).toList();
  }
}
