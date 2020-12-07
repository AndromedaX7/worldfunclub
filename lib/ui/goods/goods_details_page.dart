import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/vm/goods_details_provider.dart';
import 'package:worldfunclub/widgets/item_tile.dart';
import 'package:worldfunclub/widgets/web_page.dart';

class GoodsDetailsPage extends ProviderWidget<GoodsDetailsPageProvider> {
  final String goodsId;
  final bool self;

  GoodsDetailsPage(this.goodsId, {this.self = true})
      : super(params: [goodsId, self]);

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _GoodsDetailsPageContent(mProvider);
  }
}

class _GoodsDetailsPageContent extends StatefulWidget {
  final GoodsDetailsPageProvider provider;

  _GoodsDetailsPageContent(this.provider);

  @override
  _GoodsDetailsPageContentState createState() =>
      _GoodsDetailsPageContentState();
}

class _GoodsDetailsPageContentState extends State<_GoodsDetailsPageContent> {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.provider.goodsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    iconTheme: IconThemeData(
                      color: Colors.black54,
                    ),
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: false,
                    snap: false,
                    expandedHeight: 375.w,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      title: Text(
                        "${widget.provider.goodsName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                      background: Container(
                        width: double.infinity,
                        height: 375.w,
                        child: Stack(
                          children: [
                            Swiper(
                              itemCount: widget.provider.images.length,
                              autoplay: true,
                              loop: false,
                              itemBuilder: (bc, i) => Image.network(
                                widget.provider.images[i],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24.w),
                                    topRight: Radius.circular(24.w),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 50.w,
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 14.w, right: 14.w, bottom: 14.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  "￥",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xFFE33542)),
                                ),
                                Text(
                                  "${widget.provider.price}",
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Color(0xFFE33542)),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "￥${widget.provider.linePrice}",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0xFF999999),
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Spacer(),
                                Text(
                                  "已售${widget.provider.sales}件",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0xFF999999),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 14.w, right: 14.w, bottom: 14.w),
                            child: Text(
                              "${widget.provider.goodsName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),
                          if (widget.provider.attrs.isNotEmpty)
                            LinearTextBar2(
                              titleStyle: TextStyle(color: Color(0xFF999999)),
                              title: "已选",
                              height: 40,
                              subTitle:
                                  "${widget.provider.hasSelectedPropName}",
                              trailing: Icon(Icons.navigate_next),
                              onTap: () {
                                key.currentState.showBottomSheet((context) =>
                                    StatefulBuilder(
                                      builder: (c, state) => Container(
                                        color: Colors.white,
                                        height: 560.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: CustomScrollView(
                                                slivers: buildProps(state),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 10.w,
                                                  top: 24.w,
                                                  left: 14.w,
                                                  right: 14.w),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        widget.provider
                                                            .addCart();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        height: 44.w,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black87,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        30.w),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        30.w))),
                                                        child: Center(
                                                          child: Text(
                                                            "加入购物车",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        widget.provider
                                                            .buyNow(context);
                                                      },
                                                      child: Container(
                                                        height: 44.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.w),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          30.w)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "立即购买",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),

                          LinearTextBar2(
                            titleStyle: TextStyle(color: Color(0xFF999999)),
                            title: "配送",
                            height: 40,
                            subTitle: "至   吉林省   长春市",
                            trailing: Icon(Icons.navigate_next),
                          ),

                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),

                          LinearTextBar2(
                            title: "商品评价（${widget.provider.commentCount}）",
                            height: 40,
                          ),
                          // TODO 商品评价位
                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),

                          Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "图文详情",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            height: 40.w,
                          ),
                          if (widget.provider.html.isNotEmpty)
                            Container(
                                color: Colors.white,
                                child: WebViewFragment(widget.provider.html)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 4,
                  spreadRadius: 2),
            ]),
            height: 50.w,
            child: Row(
              children: [
                buildBottomButton(
                    50.w,
                    50.w,
                    "收藏",
                    widget.provider.collection
                        ? "images/ic_star.png"
                        : "images/ic_start_around.png",
                    () {}),
                buildBottomButton(
                    50.w, 50.w, "客服", "images/ic_message.webp", () {}),
                buildBottomButton(50.w, 50.w, "购物车", "images/ic_cart.png", () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => CartPage()));
                }),
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      key.currentState
                          .showBottomSheet((context) => StatefulBuilder(
                                builder: (c, state) => Container(
                                  color: Colors.white,
                                  height: 560.w,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: CustomScrollView(
                                          slivers: buildProps(state),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10.w,
                                            top: 24.w,
                                            left: 14.w,
                                            right: 14.w),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  widget.provider.addCart();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 44.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.w)),
                                                  child: Center(
                                                    child: Text(
                                                      "确定",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Container(
                      height: 50.w,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "加入购物车",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      key.currentState.showBottomSheet((context) =>
                          StatefulBuilder(
                            builder: (c, state) => Container(
                              color: Colors.white,
                              height: 560.w,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: CustomScrollView(
                                      slivers: buildProps(state),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 10.w,
                                        top: 24.w,
                                        left: 14.w,
                                        right: 14.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              widget.provider.buyNow(context);
                                            },
                                            child: Container(
                                              height: 44.w,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(30.w),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "确定",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                    child: Container(
                      height: 50.w,
                      color: Color(0xFFE33542),
                      child: Center(
                        child: Text(
                          "立即购买",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildProps(state) {
    List<Widget> widgets = [];
    widgets.add(_propHeader(state));
    widgets.addAll(List.generate(widget.provider.attrs.length,
        (index) => _buildProp(widget.provider.attrs[index], state)).toList());
    widgets.add(_buildCount(state));
    return widgets;
  }

  Widget _propHeader(state) {
    return SliverToBoxAdapter(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 110.w,
              height: 110.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                border: Border.all(color: Colors.black38),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.provider.skuGoodsImage)),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                    text: "￥",
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    children: [
                      TextSpan(
                          text: "${widget.provider.skuGoodsPrice}",
                          style: TextStyle(color: Colors.red, fontSize: 18.sp))
                    ])),
                SizedBox(
                  height: 12.w,
                ),
                if (widget.provider.attrs.isNotEmpty)
                  Text(
                    "已选：${widget.provider.hasSelectedPropName}",
                    style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                  ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.w),
      ),
    );
  }

  Widget _buildProp(SpecAttrBean attr, state) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
              child: Text(
                "${attr.group_name}",
                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
              ),
            ),
            Wrap(
              children: List.generate(
                attr.spec_items.length,
                (index) => GestureDetector(
                  onTap: () {
                    state(() {
                      attr.selected = index;
                      widget.provider.changeProp(state);
                    });
                  },
                  child: Container(
                    child: Text(
                      "${attr.spec_items[index].spec_value}",
                      style: TextStyle(
                          color: attr.selected == index
                              ? Colors.red
                              : Colors.black87),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: attr.selected == index
                                ? Colors.red
                                : Colors.black12),
                        borderRadius: BorderRadius.circular(16.w)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCount(state) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
              child: Text(
                "数量",
                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.provider.propCount > 1) {
                        state(() {
                          widget.provider.propCount--;
                        });
                      }
                      // widget.provider.increaseCartNum(false, goods,
                      //         (success) {
                      //       setState(() {
                      //         Fluttertoast.showToast(
                      //             msg: "操作${success ? "成功" : "失败"}");
                      //       });
                      //     });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFEEEEEE), width: 1.w),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.w),
                              bottomLeft: Radius.circular(12.w))),
                      width: 25.w,
                      height: 22.w,
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        size: 14.w,
                      )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    height: 22.w,
                    child: Center(
                      child: Text("${widget.provider.propCount}"),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFEEEEEE), width: 1.w),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      state(() {
                        if (widget.provider.propCount <
                            widget.provider.skuGoodsCount.integer) {
                          widget.provider.propCount++;
                        } else {
                          widget.provider.propCount =
                              widget.provider.skuGoodsCount.integer;
                        }
                      });
                      // widget.provider.increaseCartNum(true, goods,
                      //         (success) {
                      //       setState(() {
                      //         Fluttertoast.showToast(
                      //             msg: "操作${success ? "成功" : "失败"}");
                      //       });
                      //     });
                    },
                    child: Container(
                      width: 25.w,
                      height: 22.w,
                      child: Center(
                          child: Icon(
                        Icons.add,
                        size: 14.w,
                      )),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFEEEEEE), width: 1.w),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.w),
                              bottomRight: Radius.circular(12.w))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomButton(
      double width, double height, String name, String assets, OnTap onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              assets,
              width: 20.w,
              height: 20.w,
              fit: BoxFit.fill,
            ),
            Text(
              "$name",
              style: TextStyle(color: Color(0xFF333333), fontSize: 10.sp),
            ),
          ],
        ),
        height: height,
        width: width,
      ),
    );
  }
}
