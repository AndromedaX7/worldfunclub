import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/mine/evaluation_page.dart';
import 'package:worldfunclub/ui/home/mine/express_page.dart';
import 'package:worldfunclub/ui/order/checkout_counter_page.dart';
import 'package:worldfunclub/ui/order/order_details_page.dart';
import 'package:worldfunclub/vm/order_category_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class OrderCategoryPage extends ProviderWidget<OrderCategoryPageProvider> {
  OrderCategoryPage(int state, GoodsType goodsType)
      : super(params: [state, goodsType]);

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _OrderCategoryPageContent(mProvider);
  }
}

class _OrderCategoryPageContent extends StatefulWidget {
  final OrderCategoryPageProvider provider;

  _OrderCategoryPageContent(this.provider);

  @override
  _OrderCategoryPageContentState createState() =>
      _OrderCategoryPageContentState();
}

class _OrderCategoryPageContentState extends State<_OrderCategoryPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    widget.provider.loadOrderItem(clearData: true);
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.loadOrderItem();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListWrapper(
      data: widget.provider.orders,
      child: Container(
        color: Color(0xfff5f5f5),
        child: ListView.builder(
          controller: _controller,
          itemCount: widget.provider.orders.length,
          itemBuilder: (bc, i) => buildItem(widget.provider.orders[i]),
        ),
      ),
    );
  }

  Widget buildItem(OrderData data) {
    return GestureDetector(
      onTap: () => orderDetails(data),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Column(
          children: [
            Row(
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
                  "${data.shopName}",
                  style: TextStyle(fontSize: 13.sp),
                ),
                Spacer(),
                Text(
                  orderState(widget.provider.goodsType, data.lhOrderStatus,
                      data.orderStatus),
                  style: TextStyle(fontSize: 14.w, color: Color(0xFFFF354D)),
                ),
              ],
            ),
            Column(
              children: data.goods.map((e) => buildGoods(data, e)).toList(),
            ),
            SizedBox(
              height: 20.w,
            ),
            buildBottom(data),
          ],
        ),
      ),
    );
  }

  Widget buildGoods(OrderData data, OrderGoods goods) {
    if (widget.provider.goodsType == GoodsType.self) {
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
                                goods.goodsName,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black87),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                goods.goodsAttr,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black26),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "￥${goods.goodsPrice}",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black87),
                                  ),
                                  Spacer(),
                                  Text("x${goods.totalNum}",
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

            if (data.orderStatus != "10" && data.orderStatus != "40")
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (data.orderStatus == "30")
                      GestureDetector(
                        onTap: () => showLogistics(data,goods),
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
                    if (data.orderStatus == "30")
                      SizedBox(
                        width: 8.w,
                      ),
                    GestureDetector(
                      onTap: () => afterSale(data, goods),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 10.w),
                        margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                        child: Text(
                          "申请售后",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            /// 待评价商品会显示 按钮
            if (data.orderStatus == "40")
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Row( mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => afterSale(data, goods),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(color: Colors.red)),
                          padding: EdgeInsets.symmetric(
                              vertical: 4.w, horizontal: 10.w),
                          margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                          child: Text(
                            "申请售后",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      GestureDetector(
                        onTap: () => evaluation(data, goods),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(color: Colors.red)),
                          padding: EdgeInsets.symmetric(
                              vertical: 4.w, horizontal: 10.w),
                          margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                          child: Text(
                            "去评价",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          goods.goodsName,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black87),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          goods.goodsAttr,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black26),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              "￥${goods.goodsPrice}",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black87),
                            ),
                            Spacer(),
                            Text("x${goods.totalNum}",
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
    if (widget.provider.goodsType == GoodsType.self)
      return Container(
        child: Column(
          children: [
            /// 订单状态 非待收货时显示
            if (data.orderStatus != "30")
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "应付",
                    style: TextStyle(color: Colors.black38),
                    children: [
                      TextSpan(
                          text: "￥${data.totalPrice}",
                          style: TextStyle(color: Colors.red)),
                      TextSpan(
                          text: "(含运费￥0.00）",
                          style: TextStyle(color: Colors.black38)),
                    ],
                  ),
                ),
              ),

            /// 订单状态 待付款
            if (data.orderStatus == "10")
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
            if ((data.orderStatus == "20" || data.orderStatus == "40"))
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
                          text: "￥${data.totalPrice}",
                          style: TextStyle(color: Colors.red, fontSize: 16.sp)),
                    ],
                  ),
                ),
              ),

            /// 订单状态 待收货时显示
            if (data.orderStatus == "30")
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
                  ],
                ),
              ),

            /// 订单状态 待收货时显示
            if (data.orderStatus == "30")
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: "实付",
                    style: TextStyle(color: Colors.black38),
                    children: [
                      TextSpan(
                          text: "￥${data.totalPrice}",
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
                        text: "￥${data.totalPrice}",
                        style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: "(含运费￥0.00）",
                        style: TextStyle(color: Colors.black38)),
                  ],
                ),
              ),
            ),

            /// 乐活订单 待付款显示
            if (data.lhOrderStatus == "10")
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
            if (data.lhOrderStatus == "20" ||
                data.lhOrderStatus == "30" ||
                data.lhOrderStatus == "40")
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
                          text: "￥${data.totalPrice}",
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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (builder) =>
            CheckoutCounterPage(data, widget.provider.goodsType)));
  }

  void afterSale(OrderData data, OrderGoods goods) {
    widget.provider.afterSale(context, data, goods);
  }

  void evaluation(OrderData data, OrderGoods goods) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>EvaluationPage(data.orderId,goods))).then((value){
      if(value){
        widget.provider.loadOrderItem(clearData: true);
      }
    });
  }

  void confirmReceive(OrderData data) {
    api.receipt(data.orderId).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if(resp.code ==1){
        Fluttertoast.showToast(msg: "确认收货成功");
        widget.provider.loadOrderItem(clearData: true);
      }else{
        Fluttertoast.showToast(msg:  resp.msg );
      }
    });
  }

  void showLogistics(OrderData data,OrderGoods goods) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ExpressPage(data.orderId,goods.orderGoodsId )));

  }

  void orderDetails(OrderData data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (builder) =>
            OrderDetailsPage(data, widget.provider.goodsType)));
  }
}
