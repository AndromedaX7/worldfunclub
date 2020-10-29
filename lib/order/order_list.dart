import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/order/order_category_page.dart';
import 'package:worldfunclub/other.dart';

class OrderListPage extends StatefulWidget {
  final int state;
  final GoodsType goodsType;

  OrderListPage({this.state = 0, this.goodsType = GoodsType.self});

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.state,
      length: widget.goodsType == GoodsType.self ? 5 : 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的订单"),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 14.sp),
            labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            tabs: getTab(),
          ),
        ),
        body: TabBarView(
          children: tabBarViews(),
        ),
      ),
    );
  }

  List<Widget> tabBarViews() {
    return List<OrderCategoryPage>.generate(
        widget.goodsType == GoodsType.self ? 5 : 4, (index) => OrderCategoryPage(index,widget.goodsType));
  }

  List<Tab> getTab() {
    return widget.goodsType == GoodsType.self
        ? [
            Tab(text: "全部订单"),
            Tab(text: "待付款"),
            Tab(text: "待发货"),
            Tab(text: "待收货"),
            Tab(text: "待评价")
          ]
        : [
            Tab(text: "待付款"),
            Tab(text: "待使用"),
            Tab(text: "已使用"),
            Tab(text: "已过期")
          ];
  }
}
