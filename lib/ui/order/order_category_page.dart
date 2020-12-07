import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
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
      onTap: ()=>orderDetails(data),
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
                  "${data.shop_name}",
                  style: TextStyle(fontSize: 13.sp),
                ),
                Spacer(),
                Text(
                 orderState(widget.provider.goodsType, data.lh_order_status,
                      data.order_status),
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

            if(data.order_status != "10"&& data.order_status !="40")
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => afterSale(data, goods),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        border: Border.all(color: Colors.red)),
                    padding:
                    EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                    margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                    child: Text(
                      "申请售后",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            /// 待评价商品会显示 按钮
            if (data.order_status == "40")
              Align(
                alignment: Alignment.centerRight,
                child:Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => afterSale(data, goods),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(color: Colors.red)),
                          padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                          margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                          child: Text(
                            "申请售后",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => evaluation(data, goods),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(color: Colors.red)),
                          padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
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
    if (widget.provider.goodsType == GoodsType.self)
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
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CheckoutCounterPage(data,widget.provider.goodsType)));
  }

  void afterSale(OrderData data, OrderGoods goods){
    widget.provider.afterSale( context, data,   goods);
  }

  void evaluation(OrderData data, OrderGoods goods) {}

  void confirmReceive(OrderData data) {}

  void showLogistics(OrderData data) {}

  void orderDetails(OrderData data) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>OrderDetailsPage(data,widget.provider.goodsType)));
  }
}
