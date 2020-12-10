import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/order/live_order_commit_page.dart';
import 'package:worldfunclub/vm/goods_live_details_page_provider.dart';

class GoodsLiveDetailsPage
    extends ProviderWidget<GoodsLiveDetailsPageProvider> {
  GoodsLiveDetailsPage(String goodsId, {bool self = false})
      : super(params: [goodsId, self]);

  @override
  Widget buildContent(
      BuildContext context, GoodsLiveDetailsPageProvider provider) {
    return _GoodsLiveDetailsPageContent(provider);
  }
}

class _GoodsLiveDetailsPageContent extends StatefulWidget {
  final GoodsLiveDetailsPageProvider provider;

  _GoodsLiveDetailsPageContent(this.provider);

  @override
  _GoodsLiveDetailsPageContentState createState() =>
      _GoodsLiveDetailsPageContentState();
}

class _GoodsLiveDetailsPageContentState
    extends State<_GoodsLiveDetailsPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.goodsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "商家详情",
          style: TextStyle(color: Colors.black87),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.provider.data.shopInfo.shop_name ?? ""}",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      WidgetSpan(
                        child: Image.asset(
                          "images/ic_time_live.webp",
                          width: 12.w,
                          height: 12.w,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 8.w,
                        ),
                      ),
                      TextSpan(
                          text:
                              "${widget.provider.data.shopInfo.shop_hours ?? ""}"),
                    ]),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  Container(
                    height: 120.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.provider.data.goodsImages.length ?? 0,
                      itemBuilder: (c, i) => Container(
                        width: 164.w,
                        height: 120.w,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    widget.provider.data.goodsImages[i]))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 0.5.w,
              color: Colors.black12,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(
                CupertinoIcons.location_solid,
                color: Colors.lightBlue,
              ),
              title: Text(
                "${widget.provider.data.shopInfo.province ?? ""}${widget.provider.data.shopInfo.city ?? ""}${widget.provider.data.shopInfo.region ?? ""}${widget.provider.data.shopInfo.address ?? ""}",
                style: TextStyle(fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.phone,
                  color: Colors.orange,
                ),
              ),
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 8.w,
              color: Colors.black12,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 20.w, bottom: 10.w),
              child: Row(
                children: [
                  Container(
                    height: 15.w,
                    width: 15.w,
                    child: Center(
                      child: Text(
                        "团",
                        style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "套餐券",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (c, i) => buildItem(widget.provider.skuList[i]),
                  childCount: widget.provider.skuList.length))
        ],
      ),
    );
  }

  Widget buildItem(LiveGoodsItemMapping data) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  height: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: Colors.red,
                    image: DecorationImage(fit: BoxFit.fill,
                      image: NetworkImage(
                        "${data.sku.image}",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data.spec_value}"),
                      Spacer(),
                      Text(
                        "${data.needSubScribeDate}",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Text.rich(
                        TextSpan(
                            text: "￥${data.sku.goods_price}",
                            style: TextStyle(color: Colors.red),
                            children: [
                              TextSpan(
                                text: "￥${data.sku.goods_price}",
                                style: TextStyle(
                                    color: Colors.black12,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>LiveOrderCommitPage(widget.provider.data.shopInfo.shop_name ?? "",widget.provider.data.shopInfo.shop_hours,data))),
                      child: Container(
                        margin: EdgeInsets.only(right: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.deepOrange
                            ]
                          ),
                        ),
                        height: 28.w,
                        width: 50.w,
                        child: Center(
                          child: Text(
                            "抢购",
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14.w),
                        child: Text(
                          "已售${data.sku.goods_sales}",
                          style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(
              14.w,
            ),
            height: 1.w,
            color: Colors.black12,
          ),
        ],
      ),
      height: 109.w,
    );
  }
}
