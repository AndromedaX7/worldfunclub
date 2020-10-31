import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class HomeCategoryOtherPage extends StatefulWidget {
  final HomeCategoryData data;

  HomeCategoryOtherPage(this.data);

  @override
  _HomeCategoryOtherPageState createState() => _HomeCategoryOtherPageState();
}

class _HomeCategoryOtherPageState extends State<HomeCategoryOtherPage> {
  List<BannerData> bannerList = List();
  List<BannerData> bannerList2 = List();
  List<HomeCategoryGoods> goods = List();
  List<HomeCategoryGoods> goods2 = List();

  @override
  void initState() {
    super.initState();
    api.banner(widget.data.category_id, "1").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        setState(() {
          bannerList.addAll(bannerBean.data);
        });
      }
    });
    api.banner(widget.data.category_id, "2").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        setState(() {
          bannerList2.addAll(bannerBean.data);
        });
      }
    });

    api.categoryGoods(widget.data.category_id, true,"2", 1).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      if (bean.code == 1) {
        setState(() {
          goods.addAll(bean.data);
        });
      }
    });

    api.categoryGoods(widget.data.category_id, true,"1", 1).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      if (bean.code == 1) {
        setState(() {
          goods2.addAll(bean.data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (bannerList.length > 0)
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 130.w,
              child: Swiper(
                itemWidth: 375.w,
                itemHeight: 130.w,
                itemBuilder: (bc, i) => Image.network(
                  bannerList[i].img_url,
                  fit: BoxFit.fill,
                ),
                itemCount: bannerList.length,
                autoplay: bannerList.length > 0,
              ),
            ),
          ),
        SliverPadding(
          sliver: SliverGrid.count(
            children: _category(),
            crossAxisCount: 5,
          ),
          padding: EdgeInsets.only(top: 8.w),
        ),
        if (bannerList2.length > 0 || goods.length > 0)
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
        if (bannerList2.length > 0)
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.w))),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 130.w,
                    child: Swiper(
                      itemWidth: 375.w,
                      itemHeight: 130.w,
                      itemBuilder: (bc, i) => Image.network(
                        bannerList2[i].img_url,
                        fit: BoxFit.fill,
                      ),
                      itemCount: bannerList2.length,
                      autoplay: bannerList2.length > 0,
                    ),
                  ),
                  if (goods.length > 0)
                    Container(
                      height: 190.w,
                      child: ListView.builder(
                        itemCount: goods.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (bc, i) => buildDpjxList(goods[i]),
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
    // return CustomScrollView(
    //   slivers: [
    //     SliverToBoxAdapter(
    //       child: Container(
    //         width: double.infinity,
    //         height: 130.w,
    //         child: Swiper(
    //           itemWidth: 375.w,
    //           itemHeight: 130.w,
    //           itemBuilder: (bc, i) => Image.network(
    //             bannerList[i].img_url,
    //             fit: BoxFit.fill,
    //           ),
    //           itemCount: bannerList.length,
    //           autoplay: bannerList.length > 0,
    //         ),
    //       ),
    //     ),
    //     SliverPadding(
    //       sliver: SliverGrid.count(
    //         children: _category(),
    //         crossAxisCount: 5,
    //       ),
    //       padding: EdgeInsets.only(top: 8.w),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Container(
    //         alignment: Alignment.center,
    //         margin: EdgeInsets.symmetric(vertical: 14.w),
    //         child: Row(mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Image.asset(
    //               "images/dpjx.png",
    //               width: 5.w,
    //               height: 5.w,
    //             ),
    //             SizedBox(
    //               width: 4.w,
    //             ),
    //             Text("大牌精选"),
    //             SizedBox(
    //               width: 4.w,
    //             ),
    //             Image.asset(
    //               "images/dpjx.png",
    //               width: 5.w,
    //               height: 5.w,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Container(
    //         width: double.infinity,
    //         height: 130.w,
    //         child: Swiper(
    //           itemWidth: 375.w,
    //           itemHeight: 130.w,
    //           itemBuilder: (bc, i) => Image.network(
    //             bannerList2[i].img_url,
    //             fit: BoxFit.fill,
    //           ),
    //           itemCount: bannerList2.length,
    //           autoplay: bannerList2.length > 0,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  List<Widget> _category() {
    return List.generate(widget.data.child.length,
        (index) => _categoryItem(widget.data.child[index]));
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
    return goods2.map((e) => HomeCategoryGoodsItem2(e)).toList();
  }
}
