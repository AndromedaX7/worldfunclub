import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/checkout_counter_page_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/user_checkbox.dart';
class CheckoutCounterPage extends ProviderWidget<CheckoutCounterPageProvider> {

  CheckoutCounterPage(OrderData data,GoodsType goodsType) : super(params: [data,goodsType]);

  @override
  Widget buildContent(BuildContext context,
      CheckoutCounterPageProvider provider) {
    return _CheckoutCounterPageContent(provider);
  }
}

class _CheckoutCounterPageContent extends StatefulWidget {
  final CheckoutCounterPageProvider provider;

  _CheckoutCounterPageContent(this.provider);

  @override
  _CheckoutCounterPageContentState createState() =>
      _CheckoutCounterPageContentState();
}

class _CheckoutCounterPageContentState
    extends State<_CheckoutCounterPageContent> {
  int payPrefix = 10;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("途乐会收银台"),
      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical:14.w),
            height: 100.w,
            color: Colors.white,
            child: Center(
              child: Text("￥${widget.provider.data.totalPrice}",style: TextStyle(color: Colors.red,fontSize: 22.w),),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white),
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
                  trailing: UserCheckbox(check:payPrefix == 20),
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
                  trailing:UserCheckbox(check:payPrefix == 10),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 14.w),
            child: InkWell(
              onTap: (){
widget.provider.orderAuth(context, payPrefix);
              },
              child: Container(
                height: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.w),
                  color: Colors.red
                ),
                child: Center(
                  child: Text("去支付",style: TextStyle(fontSize: 14.w,color: Colors.white),),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.w,)
        ],
      ),
    );
  }
}
