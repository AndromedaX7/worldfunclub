import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class LiveCategoryPage extends StatefulWidget {
  final HomeCategoryData data;

  LiveCategoryPage(this.data);

  @override
  _LiveCategoryPageState createState() => _LiveCategoryPageState();
}

class _LiveCategoryPageState extends State<LiveCategoryPage> {
  List<BannerData> bannerList = List();
  List<HomeCategoryGoods> goods = List();

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

    api.categoryGoods(widget.data.category_id, false, 1).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      if (bean.code == 1) {
        setState(() {
          goods.addAll(bean.data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (bannerList.length > 0)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            sliver: SliverToBoxAdapter(
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
          ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.5),
          sliver: SliverGrid.count(crossAxisCount: 2,childAspectRatio:179/257 ,
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
    return goods.map((e) => LiveGoodsItem(e)).toList();
  }
}
