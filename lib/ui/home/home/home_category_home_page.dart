import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


//
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//     });
//   }
// //差 ，
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         if (bannerList.length > 0)
//           SliverToBoxAdapter(
//             child: Container(
//               width: double.infinity,
//               height: 130.w,
//               child: Swiper(
//                 itemWidth: 375.w,
//                 itemHeight: 130.w,
//                 itemBuilder: (bc, i) => Image.network(
//                   bannerList[i].img_url,
//                   fit: BoxFit.fill,
//                 ),
//                 itemCount: bannerList.length,
//                 autoplay: bannerList.length > 0,
//               ),
//             ),
//           ),
//         if (bannerList2.length > 0 || goods.length > 0)
//           SliverToBoxAdapter(
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(vertical: 14.w),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     "images/dpjx.png",
//                     width: 5.w,
//                     height: 5.w,
//                   ),
//                   SizedBox(
//                     width: 4.w,
//                   ),
//                   Text("大牌精选"),
//                   SizedBox(
//                     width: 4.w,
//                   ),
//                   Image.asset(
//                     "images/dpjx.png",
//                     width: 5.w,
//                     height: 5.w,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         if (bannerList2.length > 0)
//           SliverToBoxAdapter(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(6.w))),
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 130.w,
//                     child: Swiper(
//                       itemWidth: 375.w,
//                       itemHeight: 130.w,
//                       itemBuilder: (bc, i) => Image.network(
//                         bannerList2[i].img_url,
//                         fit: BoxFit.fill,
//                       ),
//                       itemCount: bannerList2.length,
//                       autoplay: bannerList2.length > 0,
//                     ),
//                   ),
//                   if (goods.length > 0)
//                     Container(
//                       height: 190.w,
//                       child: ListView.builder(
//                         itemCount: goods.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (bc, i) => buildDpjxList(goods[i]),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         SliverToBoxAdapter(
//           child: Container(
//             margin: EdgeInsets.only(top: 14.w),
//             height: 30.w,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFFFF354D), Color(0xFFEB602B)],
//               ),
//               borderRadius: BorderRadius.vertical(top: Radius.circular(4.w))
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate(
//               buildTodayTuijian()
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget buildDpjxList(HomeCategoryGoods goods) {
//     return HomeCategoryGoodsItem(goods);
//   }
//   List<HomeCategoryGoodsItem2> buildTodayTuijian(){
//       return goods2.map((e) => HomeCategoryGoodsItem2(e)).toList();
//   }