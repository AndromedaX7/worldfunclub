import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/order/order_list_page.dart';
import 'package:worldfunclub/vm/pay_success_page_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';

class PaySuccessPage extends ProviderWidget<PaySuccessPageProvider> {
  PaySuccessPage(String orderId, String orderType, String pay)
      : super(params: [orderId, orderType, pay]);

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _PaySuccessPageContent(mProvider);
  }
}

class _PaySuccessPageContent extends StatefulWidget {
  final PaySuccessPageProvider provider;

  _PaySuccessPageContent(this.provider);

  @override
  _PaySuccessPageContentState createState() => _PaySuccessPageContentState();
}

class _PaySuccessPageContentState extends State<_PaySuccessPageContent> {

  ScrollController _controller ;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        if(widget.provider.canload){
          widget.provider.loadGoodsWithPager( );
        }
      }
    });
    widget.provider.loadGoodsWithPager(clearData: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        while (App.navigatorKey.currentState.canPop()) {
          App.navigatorKey.currentState.pop();
        }

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Color(0xFFF42515),
          elevation: 0,
          actions: [
            FlatButton(
              onPressed: () {
                while (App.navigatorKey.currentState.canPop()) {
                  App.navigatorKey.currentState.pop();
                }
              },
              child: Text(
                "完成",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/ic_busi_bg.webp"),
                                fit: BoxFit.fill),
                            color: Color(0xFFF42515),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 18.w,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(14.w)),
                              color: Colors.grey[50],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5.w,
                          left: 60.w,
                          child: Text(
                            "支付成功",
                            style: TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                        ),
                        Positioned(
                          top: 25.w,
                          right: 96.w,
                          child: Image.asset(
                            "images/ic_busi_check.webp",
                            width: 32.w,
                            height: 32.w,
                          ),
                        ),
                        Positioned(
                          left: 60.w,
                          top: 47.w,
                          child: Text(
                            "实付 ￥${widget.provider.pay}",
                            style: TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 84.w,
                          left: 55.w,
                          right: 55.w,
                          height: 1.w,
                          child: Image.asset("images/ic_busi_line.webp"),
                        ),
                        Positioned(
                          left: 71.w,
                          bottom: 56.w,
                          child: GestureDetector(
                            onTap: () {
                              while (App.navigatorKey.currentState.canPop()) {
                                App.navigatorKey.currentState.pop();
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) => OrderListPage(
                                    goodsType: widget.provider.orderType == "1"
                                        ? GoodsType.self
                                        : GoodsType.live,
                                    state: widget.provider.orderType == "1" ? 2 : 1,
                                  )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  border: Border.all(color: Colors.white, width: 1.w)),
                              width: 106.w,
                              height: 30.w,
                              child: Center(
                                child: Text(
                                  "查看订单",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 71.w,
                          bottom: 56.w,
                          child: GestureDetector(
                            onTap: () {
                              while (App.navigatorKey.currentState.canPop()) {
                                App.navigatorKey.currentState.pop();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: Colors.white),
                              width: 106.w,
                              height: 30.w,
                              child: Center(
                                child: Text(
                                  "返回首页",
                                  style: TextStyle(
                                      color: Color(0xFFF42515), fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            if(widget.provider.goods2.length>0)
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 0.w, bottom: 16.w),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 3.w,
                          height: 3.w,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text("为你推荐"),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          width: 3.w,
                          height: 3.w,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if(widget.provider.goods2.length>0)
              SliverList(
                delegate: SliverChildListDelegate(
                  buildTodayTuijian(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildTodayTuijian() {
    return widget.provider.goods2
        .map((e) => Container(child: HomeCategoryGoodsItem2(e),margin: EdgeInsets.symmetric(horizontal: 16.w),))
        .toList();
  }
}
