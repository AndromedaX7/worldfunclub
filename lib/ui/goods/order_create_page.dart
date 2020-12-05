import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/order_create_page_provider.dart';
import 'package:worldfunclub/widgets/user_checkbox.dart';

class OrderCreatePage extends ProviderWidget<OrderCreatePageProvider> {
  OrderCreatePage() : super();

  @override
  Widget buildContent(BuildContext context, OrderCreatePageProvider provider) {
    return _OrderCreatePageContent(provider);
  }
}

class _OrderCreatePageContent extends StatefulWidget {
  final OrderCreatePageProvider provider;

  _OrderCreatePageContent(this.provider);

  @override
  _OrderCreatePageContentState createState() => _OrderCreatePageContentState();
}

class _OrderCreatePageContentState extends State<_OrderCreatePageContent> {
  int payPrefix = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("确认订单"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((c, i) => Text("1234"),
                        childCount: 5),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 14.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("商品总额",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16.sp)),
                              Spacer(),
                              Text("￥100.00",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16.sp))
                            ],
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Row(
                            children: [
                              Text("运费",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16.sp)),
                              Spacer(),
                              Text(
                                "+￥0.00",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 8.w, bottom: 32.w),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.w),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 4),
                                  blurRadius: 2,
                                  spreadRadius: 2),
                            ]),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text("支付方式"),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  payPrefix = 20;
                                });
                              },
                              leading: Image.network(
                                "https://open.weixin.qq.com/zh_CN/htmledition/res/assets/res-design-download/icon64_appwx_logo.png",
                                width: 36.w,
                                height: 36.w,
                              ),
                              title: Text("微信支付"),
                              trailing: UserCheckbox(check: payPrefix == 20),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  payPrefix = 10;
                                });
                              },
                              leading: Image.asset(
                                "images/ic_launcher.png",
                                width: 36.w,
                                height: 36.w,
                                fit: BoxFit.fill,
                              ),
                              title: Text("途乐币支付"),
                              trailing: UserCheckbox(check: payPrefix == 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -2),
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
              ),
              child: ListTile(
                title: Text.rich(
                  TextSpan(text: "￥", children: [
                    TextSpan(text: "123.31", style: TextStyle(fontSize: 20.sp))
                  ]),
                  style: TextStyle(color: Colors.red, fontSize: 11.sp),
                ),
                trailing: InkWell(
                  child: Container(
                    width: 90.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.w)),
                    child: Center(
                      child: Text(
                        "去支付",
                        style: TextStyle(color: Colors.white, fontSize: 16.w),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
