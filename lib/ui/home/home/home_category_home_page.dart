import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/active_bean.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/banner_page.dart';
import 'package:worldfunclub/ui/home/home/home_advert_page.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class HomeCategoryHomePage
    extends ProviderWidget<HomeCategoryHomePageProvider> {
  HomeCategoryHomePage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
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
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller=ScrollController();
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        if(widget.provider.canload){
          widget.provider.loadGoodsWithPager( );
        }
      }
    });
    widget.provider.banner();
    widget.provider.loadGoodsWithPager(clearData: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _controller,
      slivers: [
        SliverToBoxAdapter(
          child: BannerPage(double.infinity, 130.w, widget.provider.bannerTop),
        ),
        SliverPadding(
          sliver: SliverGrid.count(
            children: _category(),
            crossAxisCount: 5,
          ),
          padding: EdgeInsets.only(top: 8.w),
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
            child: Row(
              children: [
                SizedBox(width: 4.w,),
                Image.asset("images/ic_fire.webp"),
                SizedBox(width: 4.w,),
                Text("今日推荐",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),)
              ],
            ),
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
        ),
      ],
    );
  }


  List<Widget> _category() {
    return List.generate(widget.provider.category.length,
            (index) => _categoryItem(widget.provider.category[index]));
  }
  Widget buildDpjxList(HomeCategoryGoods goods) {
    return HomeCategoryGoodsItem(goods);
  }

  List<HomeCategoryGoodsItem2> buildTodayTuijian() {
    return widget.provider.goods2.map((e) => HomeCategoryGoodsItem2(e)).toList();
  }

  Widget _categoryItem(ActiveItem data) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (bc)=>HomeAdvertPage(data.activity_id,data.activity_sign,data.activity_name)));
      },
      child: Container(
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
              data.activity_name,
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
