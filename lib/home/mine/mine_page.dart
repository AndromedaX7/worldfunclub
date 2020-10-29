import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/settings/settings_page.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/widgets/item_tile.dart';
import 'package:worldfunclub/widgets/mine_order_icon.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 240.w,
                child: Image.asset(
                  "images/mine.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 260.w,
              ),
              Positioned(
                top: 80.w,
                right: 48.w,
                width: 76.w,
                height: 76.w,
                child: Image.asset("images/pop.png"),
              ),
              Positioned(top: 35.w, right: 65.w,child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(b)=>SettingsPage()));
                },
                child: Image.asset("images/ic_settings.png",width: 24.w,height: 24.w,),
              ),),
              Positioned(top: 35.w, right: 15.w,child: GestureDetector(
                child: Image.asset("images/ic_message.png",width: 24.w,height: 24.w,),
              ),),
              Positioned(
                top: 146.w,
                right: 0,
                width: 27.w,
                height: 34.w,
                child: Image.asset("images/pop2.png"),
              ),
              Positioned(
                top: 75.w,
                left: 14.w,
                width: 70.w,
                height: 70.w,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(UserIconBar.defIcon),
                ),
              ),
              Positioned(
                top: 95.w,
                left: 96.w,
                width: 70.w,
                height: 70.w,
                child: Text(
                  "data",
                  style: TextStyle(fontSize: 19.sp, color: Colors.white),
                ),
              ),
              Positioned(
                top: 120.w,
                left: 96.w,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Color(0xFFFF5989),
                  ),
                  child: Text(
                    "途乐会会员",
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 156.w,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        onPressed: () {
                          Log.e("1234");
                        },
                        child: Column(
                          children: [
                            Text(
                              "200元",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              "我的余额",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        onPressed: () {
                          Log.e("2234");
                        },
                        child: Column(
                          children: [
                            Text(
                              "200元",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              "我的收藏",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        onPressed: () {
                          Log.e("3234");
                        },
                        child: Column(
                          children: [
                            Text(
                              "200元",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              "优惠券",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 14.w,
                right: 14.w,
                height: 50.w,
                bottom: 0,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 14.w, right: 8.w),
                        padding: EdgeInsets.only(
                            left: 8.w, right: 8.w, top: 4.w, bottom: 4.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0C52),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Text(
                          "途乐会员",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                      Text(
                        "开通途乐会会员享更多权益",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 12.sp),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "立即开通",
                          style: TextStyle(color: Color(0xFFFF0C52)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10.w, left: 14.w, right: 14.w),
          sliver: SliverToBoxAdapter(
            child: Card(
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 16.w),
                height: 112.w,
                child: Column(
                  children: [
                    Container(
                      height: 35.w,
                      child: Row(
                        children: [
                          Text(
                            "我的订单",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Text(
                            "查看全部订单",
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 12.sp,
                            ),
                          ),
                          Icon(Icons.navigate_next_sharp,
                              color: Color(0xFFAAAAAA))
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.w,
                      color: Color(0xFFEEEEEE),
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "待付款",
                            "images/willPay.png",
                            () {},
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                              "待发货", "images/willSend.png", () {}),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                              "待收货", "images/willReceive.png", () {}),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                              "待评价", "images/willEvaluation.png", () {}),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                              "待付款", "images/willPay.png", () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10.w, left: 14.w, right: 14.w),
          sliver: SliverToBoxAdapter(
            child: Card(
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 16.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "商家管理",
                            "images/Merchantmanagement.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "乐活订单",
                            "images/LiveOrder.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "在线签到",
                            "images/SignIn.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "推广中心",
                            "images/G4.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "我的购物车",
                            "images/Cart.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "我的关注",
                            "images/Favrite.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "我的足迹",
                            "images/Footpoint.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MineOrderIconButton(
                            "联系客服",
                            "images/Contact.png",
                            () {},
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
