import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/banner_page.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class HomeCategoryHomePage
    extends ProviderWidget<HomeCategoryHomePageProvider> {
  HomeCategoryHomePage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _HomeCategoryHomePageContent(mProvider);
  }
}

class _HomeCategoryHomePageContent extends StatefulWidget {
  final HomeCategoryHomePageProvider provider;

  _HomeCategoryHomePageContent(this.provider);

  @override
  _HomeCategoryHomePageContentState createState() =>
      _HomeCategoryHomePageContentState();
}

class _HomeCategoryHomePageContentState
    extends State<_HomeCategoryHomePageContent> {
  List<HomeCategoryGoods> goods2 = List();

  @override
  void initState() {
    super.initState();
    widget.provider.banner();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BannerPage(double.infinity, 130.w, widget.provider.bannerTop),
        ),
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
                BannerPage(double.infinity, 130.w, widget.provider.bannerContent),

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

  Widget buildDpjxList(HomeCategoryGoods goods) {
    return HomeCategoryGoodsItem(goods);
  }

  List<HomeCategoryGoodsItem2> buildTodayTuijian() {
    return widget.provider.goods2.map((e) => HomeCategoryGoodsItem2(e)).toList();
  }
}
