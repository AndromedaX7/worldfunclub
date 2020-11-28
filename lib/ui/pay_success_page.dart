import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/pay_success_page_provider.dart';

class PaySuccessPage extends ProviderWidget<PaySuccessPageProvider> {
  PaySuccessPage(String orderId,String orderType,String pay) : super(params: [orderId,orderType,pay]);

  @override
  Widget buildContent(BuildContext context,mProvider) {
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF42515),
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "完成",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
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
                      color: Color(0xfff2f2f2),
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
                    onTap: () {},
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
                    onTap: () {},
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
            Container(
              width: double.infinity,
              color: Color(0xfff2f2f2),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " · ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.sp),
                        ),
                        Text("为你推荐"),
                        Text(
                          " · ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                color: Color(0xfff2f2f2),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (bc, i) => Text("text:$i"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
