import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/ui/goods/goods_details_page.dart';
import 'package:worldfunclub/ui/goods/goods_live_details_page.dart';

class HomeCategoryGoodsItem extends StatelessWidget {
  final HomeCategoryGoods goods;

  HomeCategoryGoodsItem(this.goods);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (bc) => GoodsDetailsPage(
              goods.goodsId,
            ),
          ),
        );
        // launchGoodsDetails(context, goods.goods_id, useFlutter: true);
      },
      child: Container(
        width: 116.w,
        color: Colors.white,
        height: 188.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.w,
            ),
            Image.network(
              goods.goodsImage,
              width: 108.w,
              height: 108.w,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              alignment: Alignment.centerLeft,
              child: Text(
                goods.goodsName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "￥${goods.goodsPrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    ),
                    Spacer(),
                    Text(
                      "￥${goods.linePrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 10.sp,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "热销${goods.goodsSales}件",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: Color(0xFF999999), fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCategoryGoodsItem2 extends StatelessWidget {
  final HomeCategoryGoods goods;

  HomeCategoryGoodsItem2(this.goods);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (builder) => GoodsDetailsPage(goods.goodsId))),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.w),
        width: 346.w,
        height: 124.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Row(
          children: [
            Image.network(
              goods.goodsImage,
              width: 124.w,
              height: 124.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.w),
                    child: Text(
                      goods.goodsName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 96.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("data"),
                            Container(
                                margin: EdgeInsets.only(top: 36.w),
                                child: Text(
                                  "￥${goods.linePrice}",
                                  style: TextStyle(
                                      color: Color(0xFF999999),
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14.sp),
                                )),
                            Text(
                              "￥${goods.goodsPrice}",
                              style: TextStyle(
                                  fontSize: 16.sp, color: Color(0xFFFF364C)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 110.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "赚￥3.20",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Color(0xFF999999)),
                            ),
                            Text(
                              "热销${goods.goodsSales}件",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Color(0xFF999999)),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            Text(
                              "升级会员更优惠",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Color(0xFFFF364C)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LiveGoodsItem extends StatelessWidget {
  final HomeCategoryGoods goods;

  LiveGoodsItem(this.goods);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // launchGoodsDetails(context, goods.goods_id, type: GoodsType.live);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (c) => GoodsLiveDetailsPage(goods.goodsId,self: false,)));
        //
        /// TODO live Goods Details
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 5.5.w, right: 5.5.w, bottom: 5.w, top: 5.w),
        color: Color(0xFFF5F5F5),
        width: 179.w,
        height: 257.w,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                goods.goodsImage,
                width: 168.w,
                height: 130.w,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                child: Text(
                  goods.goodsName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.only(bottom: 6.w),
                child: Text(
                  "环境很好很适合去",
                  style: TextStyle(fontSize: 11.sp, color: Color(0xffaaaaaa)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 8.5.w,
                  ),
                  Text(
                    "￥",
                    style: TextStyle(fontSize: 11.sp, color: Color(0xFFFF364C)),
                  ),
                  Text("${goods.goodsPrice}",
                      style:
                          TextStyle(fontSize: 17.sp, color: Color(0xFFFF364C))),
                  Text("起",
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xFFaaaaaa))),
                ],
              ),
              Spacer(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.5.w),
                  child: Text("已售${goods.goodsSales}+",
                      style: TextStyle(
                          fontSize: 11.sp, color: Color(0xFFaaaaaa)))),
              SizedBox(
                height: 14.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoodsItemForSearch extends StatelessWidget {
  final HomeCategoryGoods goods;
  final GoodsType type;

  GoodsItemForSearch(this.goods, this.type);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (bc) => GoodsDetailsPage(
                  goods.goodsId,
                )));
      },
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.w)),
        height: 256.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 4.w,
            // ),
            Container(
              width: 170.w,
              height: 170.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  image: DecorationImage(
                    image: NetworkImage(
                      goods.goodsImage,
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              alignment: Alignment.centerLeft,
              child: Text(
                goods.goodsName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Colors.black87, fontSize: 12.sp),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "￥${goods.goodsPrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.red, fontSize: 14.sp),
                    ),
                    Text(
                      "￥${goods.linePrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 12.sp,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(bottom: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "热销${goods.goodsSales}件",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: Color(0xFF999999), fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
