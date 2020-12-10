import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/dev_wrapper/dev_wrapper.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/withdraw/withdraw_page.dart';
import 'package:worldfunclub/vm/balance_background_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class BalanceBackgroundPage
    extends ProviderWidget<BalanceBackgroundPageProvider> {
  BalanceBackgroundPage() : super();

  @override
  Widget buildContent(
      BuildContext context, BalanceBackgroundPageProvider provider) {
    return _BalanceBackgroundPageContent(provider);
  }
}

class _BalanceBackgroundPageContent extends StatefulWidget {
  final BalanceBackgroundPageProvider provider;

  _BalanceBackgroundPageContent(this.provider);

  @override
  _BalanceBackgroundPageContentState createState() =>
      _BalanceBackgroundPageContentState();
}

class _BalanceBackgroundPageContentState
    extends State<_BalanceBackgroundPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.loadList();
        }
      }
    });
    widget.provider.loadBalance();
    widget.provider.loadList(clearData: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(brightness: Brightness.dark,
            title: Text(
              "商家管理",
              style: TextStyle(color: Colors.white),
            ),
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 240.w,
            actions: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>WithdrawPage()));
                },
                child: Image.asset("images/ic_with_draw.webp"),
              ),
              InkWell(
                onTap: (){
                  launchScan(context);
                },
                child: Image.asset("images/ic_scan.webp"),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                height: 240.w,
                color: Color(0xfff5f5f5),
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 255.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/ic_bala_appbar_bg.webp")),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.w),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 4),
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>WithdrawPage()));
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "立即提现",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.red),
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                          Image.asset(
                                              "images/ic_with_draw_red.webp")
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              color: Colors.black12,
                              width: 0.5.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  launchScan(context);
                                },
                                child: Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "扫码核销",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Image.asset("images/ic_scan_red.webp")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      left: 24.w,
                      right: 24.w,
                      height: 70.w,
                      bottom: 0,
                    ),
                    Positioned(
                      left: 14.w,
                      right: 14.w,
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${widget.provider.balance}",
                            style:
                                TextStyle(fontSize: 18.w, color: Colors.white),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Image.asset("images/ic_bala_circle.webp")
                        ],
                      )),
                      bottom: 100.w,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 150.w,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 1.w,
                              width: 85.w,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset("images/ic_bala_circle2.webp"),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              "我的余额",
                              style: TextStyle(
                                  fontSize: 14.w, color: Colors.white),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Image.asset("images/ic_bala_circle2.webp"),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              height: 1.w,
                              width: 85.w,
                              color: Colors.white,
                            )
                          ],
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
              height: 43.w,
              color: Colors.white,
              margin: EdgeInsets.only(top: 20.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        gradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.pink,
                        ])),
                    width: 14.w,
                    height: 14.w,
                    margin: EdgeInsets.only(left: 14.w, right: 8.w),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        width: 8.w,
                        height: 8.w,
                      ),
                    ),
                  ),
                  Text("我的订单")
                ],
              ),
            ),
          ),
          if (widget.provider.lists.length > 0)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (c, i) => _buildItem(widget.provider.lists[i]),
                  childCount: widget.provider.lists.length),
            ),
          if (widget.provider.lists.length == 0)
            SliverToBoxAdapter(
              child: Container(height: 400.w, child: ListWrapper()),
            ),
        ],
      ),
    );
  }

  Widget _buildItem(WriteOffData list) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 4.w),
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("用户名称：${list.shopName}",
                    style: TextStyle(fontSize: 12.w, color: Colors.black54)),
              ],
            ),
            Text("商品名称：${list.goods[0].goodsName}",
                style: TextStyle(fontSize: 12.w, color: Colors.black54)),
            Text("有效时间：${list.startTime} - ${list.endTime}",
                style: TextStyle(fontSize: 12.w, color: Colors.black54)),
            Text(
              "￥${list.totalPrice}",
              style: TextStyle(fontSize: 18.w, color: Colors.red),
            ),
          ],
        ));
  }
}
