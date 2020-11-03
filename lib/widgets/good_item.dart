import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/goods/goods_details.dart';

class HomeCategoryGoodsItem extends StatefulWidget {
  final HomeCategoryGoods goods;

  HomeCategoryGoodsItem(this.goods);

  @override
  _HomeCategoryGoodsItemState createState() => _HomeCategoryGoodsItemState();
}

class _HomeCategoryGoodsItemState extends State<HomeCategoryGoodsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(bc)=>GoodsDetailsPage()));
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
              widget.goods.goods_image,
              width: 108.w,
              height: 108.w,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.goods.goods_name,
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
                      "￥${widget.goods.goods_price}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    ),
                    Spacer(),
                    Text(
                      "￥${widget.goods.line_price}",
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
                "热销${widget.goods.goods_sales}件",
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

class HomeCategoryGoodsItem2 extends StatefulWidget {
  final HomeCategoryGoods goods;

  HomeCategoryGoodsItem2(this.goods);

  @override
  _HomeCategoryGoodsItem2State createState() => _HomeCategoryGoodsItem2State();
}

class _HomeCategoryGoodsItem2State extends State<HomeCategoryGoodsItem2> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget.goods.goods_image,
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
                    widget.goods.goods_name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
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
                                "￥${widget.goods.line_price}",
                                style: TextStyle(
                                    color: Color(0xFF999999),
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14.sp),
                              )),
                          Text(
                            "￥${widget.goods.goods_price}",
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
                            "热销${widget.goods.goods_sales}件",
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
    );
  }
}

class LiveGoodsItem extends StatefulWidget {
  final HomeCategoryGoods goods;

  LiveGoodsItem(this.goods);

  @override
  _LiveGoodsItemState createState() => _LiveGoodsItemState();
}

class _LiveGoodsItemState extends State<LiveGoodsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.goods.goods_image,
              width: 168.w,
              height: 130.w,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
              child: Text(widget.goods.goods_name,maxLines: 1, overflow: TextOverflow.ellipsis,),
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
                Text("${widget.goods.goods_price}",
                    style:
                        TextStyle(fontSize: 17.sp, color: Color(0xFFFF364C))),
                Text("起",
                    style:
                        TextStyle(fontSize: 11.sp, color: Color(0xFFaaaaaa))),
              ],
            ),
            Spacer(),
            Container( padding: EdgeInsets.symmetric(horizontal: 8.5.w),
                child: Text("已售${widget.goods.goods_sales}+",
                    style:
                        TextStyle(fontSize: 11.sp, color: Color(0xFFaaaaaa)))),
            SizedBox(
              height: 14.w,
            )
          ],
        ),
      ),
    );
  }
}
