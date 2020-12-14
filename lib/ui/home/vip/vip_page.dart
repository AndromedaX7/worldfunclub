import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/vip/my_profit_page.dart';
import 'package:worldfunclub/ui/home/vip/my_vip_page.dart';
import 'package:worldfunclub/ui/withdraw/withdraw_page.dart';
import 'package:worldfunclub/vm/vip_page_provider.dart';

class VipPage extends ProviderWidget<VipPageProvider> {
  VipPage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _VipPageContent(mProvider);
  }
}

class _VipPageContent extends StatefulWidget {
  final VipPageProvider provider;

  _VipPageContent(this.provider);

  @override
  _VipPageContentState createState() => _VipPageContentState();
}

class _VipPageContentState extends State<_VipPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(
                height: 240.w,
                child: Stack(
                  children: [
                    Container(
                      height: 200.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE8D2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.w),
                          bottomRight: Radius.circular(32.w),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.w,
                          ),
                          Text("我的会员"),
                          Container(
                            width: double.infinity,
                            height: 161.w,
                            margin: EdgeInsets.all(14.w),
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      width: 55.w,
                                      height: 55.w,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "$avatar",
                                        ),
                                      ),
                                    ),
                                    title: Row(
                                      children: [
                                        Text("$nickName"),
                                        Container(
                                            margin: EdgeInsets.only(left: 8.w),
                                            child: Text("升级会员",
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Color(0xFFE13541)))),
                                      ],
                                    ),
                                    subtitle: Text(
                                      "我的邀请码：265648",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Color(0xFFE13541)),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("专属导师"),
                                        Icon(Icons.navigate_next)
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10.w)),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFFFECDA),
                                          Color(0xFFFFD2A4)
                                        ])),
                                    child: ListTile(
                                      leading: Icon(
                                        CupertinoIcons.money_yen_circle,
                                        size: 24.w,
                                      ),
                                      title: Text("收益提现"),
                                      trailing: FlatButton(
                                        child: Text("提现"),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      WithdrawPage()));
                                        },
                                      ),
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
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (b)=>MyVipPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.w,left: 16.w,right: 16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.w)
                  ),

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 34.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("我的会员"),
                            Spacer(),
                            Text(
                              "更多",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            Icon(Icons.navigate_next, color: Colors.grey[400])
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          height: 1.w,
                          color: Colors.grey[100]),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 75.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0人",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      "今日新增",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0人",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      "我的会员",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0人",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      "全部会员",
                                      style: TextStyle(color: Colors.black54),
                                    )
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
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (b)=>MyProfitPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.w,left: 16.w,right: 16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.w)
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 34.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("预估收益"),
                            Spacer(),
                            Text(
                              "更多",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            Icon(Icons.navigate_next, color: Colors.grey[400])
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w,),
                          height: 1.w,
                          color: Colors.grey[100]),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 75.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "￥0.0",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      "今日购买订单",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "￥0.0",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      "昨日购买订单",
                                      style: TextStyle(color: Colors.black54),
                                    )
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
            ],
          ),
        ),
      ),
    );
  }
}
