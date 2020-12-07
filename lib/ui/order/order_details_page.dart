import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/order/checkout_counter_page.dart';
import 'package:worldfunclub/vm/order_details_page_provider.dart';

class OrderDetailsPage extends ProviderWidget<OrderDetailsPageProvider> {
  OrderDetailsPage(OrderData data, GoodsType type)
      : super(params: [data, type]);

  @override
  Widget buildContent(BuildContext context, OrderDetailsPageProvider provider) {
    return _OrderDetailsPageContent(provider);
  }
}

class _OrderDetailsPageContent extends StatefulWidget {
  final OrderDetailsPageProvider provider;

  _OrderDetailsPageContent(this.provider);

  @override
  _OrderDetailsPageContentState createState() =>
      _OrderDetailsPageContentState();
}

class _OrderDetailsPageContentState extends State<_OrderDetailsPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.orderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("订单详情"),
        elevation: 0,
      ),
      body:Column(

        children: [
          Expanded(child:
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 170.w,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.w, left: 14.w),
                          child: Text(
                            orderState(
                                widget.provider.type,
                                widget.provider.data.lh_order_status,
                                widget.provider.data.order_status),
                            style: TextStyle(color: Colors.white, fontSize: 25.sp),
                          ),
                          color: Colors.red,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14.w),
                          height: 34.w,
                          width: double.infinity,
                          color: Colors.red,
                          child: Text(
                            "剩余 00:11:30自动取消",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Container(
                          height: 80.w,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                height: 45.w,
                                child: Container(
                                  color: Colors.red,
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                right: 14.w,
                                top: 10,
                                height: 70.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(4, 4),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(8.w),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "images/ic_location_order.webp",
                                        width: 32.w,
                                        height: 34.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 36.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                text:
                                                widget.provider.type==GoodsType.self?  "${widget.provider.orderRemote.address_name}":"${widget.provider.orderRemote.name}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12.sp),
                                                children: [
                                                  WidgetSpan(
                                                    child: SizedBox(
                                                      width: 8.w,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                    widget.provider.type==GoodsType.self?  "${widget.provider.orderRemote.address_phone}":"${widget.provider.orderRemote.phone}",
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 12.sp),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              widget.provider.type==GoodsType.self?"${widget.provider.orderRemote.address_province}${widget.provider.orderRemote.address_city}${widget.provider.orderRemote.address_region}${widget.provider.orderRemote.address_detail}"
                                             :"${widget.provider.orderRemote.shop_province}${widget.provider.orderRemote.shop_city}${widget.provider.orderRemote.shop_region}${widget.provider.orderRemote.shop_address}",
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12.sp),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 4),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.w),
                    child: Column(
                      children: goods(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10.w,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 4),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.w),
                    child: Column(
                      children: [
                        Row(
                          children: [Text("支付方式"), Spacer(), Text(payInfo("${widget.provider.orderRemote.pay_type}"))],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          children: [Text("商品总额"), Spacer(), Text("￥${widget.provider.data.total_price}")],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          children: [Text("运费"), Spacer(), Text("+￥0.00",style: TextStyle(
                            color: Colors.red
                          ),)],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Container(
                          height: 0.5.w,
                          color: Color(0xFFEEEEEE),
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          children: [Text("实际支付"), Spacer(), Text("￥${widget.provider.data.total_price}",style: TextStyle(color: Colors.red),)],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10.w,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 4),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.w),
                    child: Column(
                      children: [
                        Row(
                          children: [Text("订单信息"),],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          children: [Text("订单编号"), Spacer(), Text("${widget.provider.orderRemote.order_no}")],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          children: [Text("下单时间"), Spacer(), Text("${widget.provider.orderRemote.create_time}")],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 14.w),
            height: 60.w,
            color: Colors.white,
            child: buildBottom(widget.provider.data),
          ),
        ],
      )



    );
  }
  
  String payInfo(String code){
    switch(code){
      case "10" :return "途乐币支付";
      case "20" :return "微信支付";
      case "-30" :return "支付宝支付";
      default: return "其他支付";
    }
  }

  List<Widget> goods() {
    List<Widget> goods = [];
    goods.add(Row(
      children: [
        Image.asset(
          "images/ic_shop.png",
          width: 16.w,
          height: 16.w,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          "${widget.provider.data.shop_name}",
          style: TextStyle(fontSize: 13.sp),
        ),
        Spacer(),
        Text(
          orderState(widget.provider.type, widget.provider.data.lh_order_status,
              widget.provider.data.order_status),
          style: TextStyle(fontSize: 14.w, color: Color(0xFFFF354D)),
        ),
      ],
    ));
    goods.addAll(widget.provider.data.goods
        .map((e) => buildGoods(widget.provider.data, e))
        .toList());
    return goods;
  }

  Widget buildGoods(OrderData data, OrderGoods goods) {
    if (widget.provider.type == GoodsType.self) {
      return Container(
        child: Column(
          children: [
            Container(
              height: 70.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              goods.image,
                            ),
                          ),
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 60.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                goods.goods_name,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black87),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                goods.goods_attr,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black26),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "￥${goods.goods_price}",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black87),
                                  ),
                                  Spacer(),
                                  Text("x${goods.total_num}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black26)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// 待评价商品会显示 按钮
            // if (data.order_status == "40")
            //   Align(
            //     alignment: Alignment.centerRight,
            //     child: GestureDetector(
            //       onTap: () => evaluation(data, goods),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16.w),
            //             border: Border.all(color: Colors.red)),
            //         padding:
            //         EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
            //         margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
            //         child: Text(
            //           "去评价",
            //           style: TextStyle(color: Colors.red),
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      );
    } else {
      return Container(
        height: 70.w,
        child: Column(
          children: [
            SizedBox(
              height: 10.w,
            ),
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        goods.image,
                      ),
                    ),
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Container(
                    height: 60.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          goods.goods_name,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black87),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          goods.goods_attr,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black26),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              "￥${goods.goods_price}",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black87),
                            ),
                            Spacer(),
                            Text("x${goods.total_num}",
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black26)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  /// 订单状态转换

  /// 订单底栏
  Widget buildBottom(OrderData data) {
    /// 通过 [OrderCategoryPageProvider.goodsType] 区分乐活和自营商品
    if (widget.provider.type == GoodsType.self)
      return Container(
        child: Column(
          children: [
            /// 订单状态 非待收货时显示
            if (data.order_status != "30")
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "应付",
                    style: TextStyle(color: Colors.black38),
                    children: [
                      TextSpan(
                          text: "￥${data.total_price}",
                          style: TextStyle(color: Colors.red)),
                      TextSpan(
                          text: "(含运费￥0.00）",
                          style: TextStyle(color: Colors.black38)),
                    ],
                  ),
                ),
              ),

            /// 订单状态 待付款
            if (data.order_status == "10")
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => pay(data),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        border: Border.all(color: Colors.red)),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                    margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                    child: Text(
                      "去付款",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),

            /// 订单状态 待发货或待评价
            if ((data.order_status == "20" || data.order_status == "40"))
              Container(
                margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "共计支付",
                    style: TextStyle(color: Colors.black87, fontSize: 16.sp),
                    children: [
                      TextSpan(
                          text: "￥${data.total_price}",
                          style: TextStyle(color: Colors.red, fontSize: 16.sp)),
                    ],
                  ),
                ),
              ),

            /// 订单状态 待收货时显示
            if (data.order_status == "30")
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => confirmReceive(data),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 10.w),
                        margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                        child: Text(
                          "确认收货",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    GestureDetector(
                      onTap: () => showLogistics(data),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            border: Border.all(color: Colors.black38)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 10.w),
                        margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                        child: Text(
                          "查看物流",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            /// 订单状态 待收货时显示
            if (data.order_status == "30")
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "实付",
                    style: TextStyle(color: Colors.black38),
                    children: [
                      TextSpan(
                          text: "￥${data.total_price}",
                          style: TextStyle(color: Colors.red)),
                      TextSpan(
                          text: "(含运费￥0.00）",
                          style: TextStyle(color: Colors.black38)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    else {
      return Container(
        child: Column(
          children: [
            /// 乐活订单
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  text: "应付",
                  style: TextStyle(color: Colors.black38),
                  children: [
                    TextSpan(
                        text: "￥${data.total_price}",
                        style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: "(含运费￥0.00）",
                        style: TextStyle(color: Colors.black38)),
                  ],
                ),
              ),
            ),

            /// 乐活订单 待付款显示
            if (data.lh_order_status == "10")
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => pay(data),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        border: Border.all(color: Colors.red)),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                    margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                    child: Text(
                      "去付款",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),

            /// 乐活订单 非待付款显示
            if (data.lh_order_status == "20" ||
                data.lh_order_status == "30" ||
                data.lh_order_status == "40")
              Container(
                margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "共计支付",
                    style: TextStyle(color: Colors.black87, fontSize: 16.sp),
                    children: [
                      TextSpan(
                          text: "￥${data.total_price}",
                          style: TextStyle(color: Colors.red, fontSize: 16.sp)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }

  void pay(OrderData data) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => CheckoutCounterPage(data,widget.provider.type)));
  }

  void evaluation(OrderData data, OrderGoods goods) {}

  void confirmReceive(OrderData data) {}

  void showLogistics(OrderData data) {}

  void orderDetails(OrderData data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (builder) => OrderDetailsPage(data, widget.provider.type)));
  }
}
