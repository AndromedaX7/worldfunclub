import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/balance/balance_page.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/ui/home/mine/after_sale_page.dart';
import 'package:worldfunclub/ui/home/mine/my_collection_page.dart';
import 'package:worldfunclub/ui/home/mine/my_coupon_page.dart';
import 'package:worldfunclub/ui/home/mine/my_footprint_page.dart';
import 'package:worldfunclub/ui/merchant/balance_background_page.dart';
import 'package:worldfunclub/ui/order/order_list_page.dart';
import 'package:worldfunclub/ui/settings/settings_page.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/vm/mine_page_provider.dart';
import 'package:worldfunclub/widgets/mine_order_icon.dart';

class MinePage extends ProviderWidget<MinePageProvider> {
  MinePage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _MinePageContent(mProvider);
  }
}

class _MinePageContent extends StatefulWidget {
  final MinePageProvider provider;

  _MinePageContent(this.provider);

  @override
  _MinePageContentState createState() => _MinePageContentState();
}

class _MinePageContentState extends State<_MinePageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.userBalances();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                Positioned(
                  top: 35.w,
                  right: 65.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (b) => SettingsPage()));
                    },
                    child: Image.asset(
                      "images/ic_settings.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
                Positioned(
                  top: 35.w,
                  right: 15.w,
                  child: GestureDetector(
                    child: Image.asset(
                      "images/ic_message.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
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
                    backgroundImage: NetworkImage(avatar),
                  ),
                ),
                Positioned(
                  top: 95.w,
                  left: 96.w,
                  width: 70.w,
                  height: 70.w,
                  child: Text(
                    "$nickName",
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) =>
                                    BalancePage(widget.provider.balance)));
                          },
                          child: Column(
                            children: [
                              Text(
                                "${widget.provider.balance}元",
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
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (builder) => MyCollectionPage())),
                          child: Column(
                            children: [
                              Text(
                                "${widget.provider.collectCount}",
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
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (builder) => MyCouponPage())),
                          child: Column(
                            children: [
                              Text(
                                "0张",
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
                  height: 122.w,
                  child: Column(
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => OrderListPage()));
                          // launchOrderList(context, 0, GoodsType.self);
                        },
                        child: Container(
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
                              () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (c) => OrderListPage(
                                          goodsType: GoodsType.self,
                                          state: 1,
                                        )));
                                // launchOrderList(context, 1, GoodsType.self);
                              },
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: MineOrderIconButton(
                                "待发货", "images/willSend.png", () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => OrderListPage(
                                        goodsType: GoodsType.self,
                                        state: 2,
                                      )));
                            }),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: MineOrderIconButton(
                                "待收货", "images/willReceive.png", () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => OrderListPage(
                                        goodsType: GoodsType.self,
                                        state: 3,
                                      )));
                            }),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: MineOrderIconButton(
                                "待评价", "images/willEvaluation.png", () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => OrderListPage(
                                        goodsType: GoodsType.self,
                                        state: 4,
                                      )));
                            }),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: MineOrderIconButton(
                                "退款/售后",
                                "images/willRefund.png",
                                () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            AfterSalePage()))),
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
                              () {
                                if (userType == "2")
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder) =>
                                          BalanceBackgroundPage()));
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("您还不是商户用户,详情请致电客服"),
                                      action: SnackBarAction(
                                        label: "致电客服",
                                        onPressed: (){
                                          Log.d("致电客服");
                                          // TODO 缺少客服联系方式
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: MineOrderIconButton(
                              "乐活订单",
                              "images/LiveOrder.png",
                              () =>
                                  /* Navigator.of(context).push(MaterialPageRoute(
                                      builder: (b) => OrderListPage(
                                            goodsType: GoodsType.live,
                                          )))*/
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => OrderListPage(
                                            goodsType: GoodsType.live,
                                            state: 0,
                                          ))),
                              // launchOrderList(context, 0, GoodsType.live,useFlutter: true),
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
                              () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (builder) => CartPage())),
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
                              () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (builder) => MyFootprintPage())),
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
      ),
    );
  }
}
