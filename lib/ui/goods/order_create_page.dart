import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/address/address_list_page.dart';
import 'package:worldfunclub/vm/order_create_page_provider.dart';
import 'package:worldfunclub/widgets/user_checkbox.dart';

class OrderCreatePage extends ProviderWidget<OrderCreatePageProvider> {
  final bool cart;

  OrderCreatePage(List<GoodsListBean> goods, {this.cart = true})
      : super(params: [goods, cart]);

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
    widget.provider.loadDefaultAddress();
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
                  SliverToBoxAdapter(
                    child: Container(
                      margin:
                          EdgeInsets.only(left: 14.w, right: 14.w, top: 14.w),
                      child: InkWell(
                        onTap: () async {
                          AddressData data = await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (builder) => AddressListPage(
                                        selectAddress: true,
                                      )));
                          if (data != null) widget.provider.data = data;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8.w)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 4),
                                  blurRadius: 2,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: widget.provider.data == null
                                    ? Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40.w,
                                              height: 40.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.w),
                                                  color: Colors.black12),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.w,
                                            ),
                                            Text(
                                              "暂无收货地址，请点击添加",
                                              style: TextStyle(
                                                  color: Colors.black12,
                                                  fontSize: 14.sp),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                    child: Text(widget
                                                        .provider.data.name)),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(widget.provider.data.phone)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16.w,
                                            ),
                                            Text(
                                              "${widget.provider.data.region.province}${widget.provider.data.region.city}${widget.provider.data.region.region}${widget.provider.data.detail}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                              Image.asset("images/ic_address_line.webp"),
                            ],
                          ),
                          height: 85.w,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.w),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 4),
                                  blurRadius: 2,
                                  spreadRadius: 2),
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14.w,
                            ),
                            Column(
                                children: List.generate(
                              widget.provider.goods.length,
                              (index) =>
                                  orderGoods(widget.provider.goods[index]),
                            )),
                            SizedBox(
                              height: 4.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    border: InputBorder.none,
                                    hintText: "买家留言200字以内（选填）"),
                                maxLength: 200,
                                minLines: 1,
                                maxLines: 10,
                              ),
                            ),
                            ListTile(
                              trailing: Text.rich(TextSpan(
                                  text: "小计：",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14.w),
                                  children: [
                                    TextSpan(
                                        text:
                                            "￥${widget.provider.price.toStringAsFixed(2)}",
                                        style: TextStyle(color: Colors.red))
                                  ])),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              Text(
                                  "￥${widget.provider.price.toStringAsFixed(2)}",
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
                    TextSpan(
                        text: "${widget.provider.price.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20.sp))
                  ]),
                  style: TextStyle(color: Colors.red, fontSize: 11.sp),
                ),
                trailing: InkWell(
                  onTap: () {
                    widget.provider.commit("", payPrefix, (oid) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (c) => AlertDialog(
                                title: Text("订单已生成"),
                                content: Text("您的订单已创建完成"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text("放弃支付")),
                                  FlatButton(
                                      onPressed: () {
                                        widget.provider
                                            .orderAuth(context, payPrefix, oid);

                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text("去支付")),
                                ],
                              ));
                    },
                    );
                  },
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

  Widget orderGoods(GoodsListBean goods) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4.w,
        horizontal: 10.w,
      ),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Container(
            child: Row(
              children: [
                Image.network(
                  "${goods.goods_image}",
                  width: 75.w,
                  height: 75.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Flexible(
                  child: Container(
                    height: 75.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                " ${goods.goods_name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text("x${goods.total_num}"),
                          ],
                        ),
                        Text(
                          "${goods.goods_attr}",
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xFFAAAAAA)),
                        ),
                        Row(
                          children: [
                            Text(
                              "￥${goods.goods_price}",
                              style: TextStyle(
                                  color: Color(0xFFE33542), fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  fit: FlexFit.tight,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
