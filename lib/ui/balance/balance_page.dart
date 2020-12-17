import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/withdraw/withdraw_page.dart';
import 'package:worldfunclub/vm/balance_page_provider.dart';

class BalancePage extends ProviderWidget<BalancePageProvider> {
  BalancePage(String balance) : super(params: [balance]);

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _BalancePageContent(mProvider);
  }
}

class _BalancePageContent extends StatefulWidget {
  final BalancePageProvider provider;

  _BalancePageContent(this.provider);

  @override
  _BalancePageContentState createState() => _BalancePageContentState();
}

class _BalancePageContentState extends State<_BalancePageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("我的余额"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 4.w,
            ),
            Container(
              width: double.infinity,
              height: 230.w,
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              child: Card(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "账户余额（元）",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      Text(
                        "${widget.provider.balance}",
                        style: TextStyle(
                            fontSize: 35.sp, color: Color(0xFFFF354D)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>WithdrawPage()));
              },
              child: Container(
                height: 48.w,
                decoration: BoxDecoration(
                  color: Color(0xFFE33542),
                  borderRadius: BorderRadius.circular(24.w),
                ),
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Center(
                  child: Text(
                    "提现",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
