import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/live_order_commit_page_provider.dart';
import 'package:worldfunclub/widgets/user_checkbox.dart';

class LiveOrderCommitPage extends ProviderWidget<LiveOrderCommitPageProvider> {
  LiveOrderCommitPage(String shopName, String hours, LiveGoodsItemMapping data)
      : super(params: [shopName, hours, data]);

  @override
  Widget buildContent(
      BuildContext context, LiveOrderCommitPageProvider provider) {
    return _LiveOrderCommitPageContent(provider);
  }
}

class _LiveOrderCommitPageContent extends StatefulWidget {
  final LiveOrderCommitPageProvider provider;

  _LiveOrderCommitPageContent(this.provider);

  @override
  _LiveOrderCommitPageContentState createState() =>
      _LiveOrderCommitPageContentState();
}

class _LiveOrderCommitPageContentState
    extends State<_LiveOrderCommitPageContent> {
  int payPrefix = 10;

  String date = "";
  String name;
  String phone;
  String remark;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(widget.provider.shopName ?? "乐活订单结算"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: Colors.white),
              child: Container(
                margin: EdgeInsets.only(top: 8.w),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 80.w,
                            margin: EdgeInsets.symmetric(horizontal: 14.w),
                            height: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  "${widget.provider.data.sku.image}",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${widget.provider.data.specValue}"),
                                Spacer(),
                                Text(
                                  "${widget.provider.data.needSubScribeDate}",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                Text.rich(
                                  TextSpan(
                                      text:
                                          "￥${widget.provider.data.sku.goodsPrice}",
                                      style: TextStyle(color: Colors.red),
                                      children: [
                                        TextSpan(
                                          text:
                                              "￥${widget.provider.data.sku.goodsPrice}",
                                          style: TextStyle(
                                              color: Colors.black12,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 14.w),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    widget.provider.increaseCartNum(false);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFEEEEEE),
                                            width: 1.w),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.w),
                                            bottomLeft: Radius.circular(12.w))),
                                    width: 25.w,
                                    height: 22.w,
                                    child: Center(
                                        child: Icon(
                                      Icons.remove,
                                      size: 14.w,
                                    )),
                                  ),
                                ),
                                Container(
                                  width: 32.w,
                                  height: 22.w,
                                  child: Center(
                                    child:
                                        Text("${widget.provider.totalCount}"),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFEEEEEE), width: 1.w),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.provider.increaseCartNum(true);
                                  },
                                  child: Container(
                                    width: 25.w,
                                    height: 22.w,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 14.w,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFEEEEEE),
                                            width: 1.w),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12.w),
                                            bottomRight:
                                                Radius.circular(12.w))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 14.w,
                      ),
                      height: 1.w,
                      color: Colors.black12,
                    ),
                    ListTile(
                      leading: Text("小计"),
                      trailing: Text(
                        "￥${(widget.provider.data.sku.goodsPrice.d * widget.provider.totalCount).toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                height: 160.w,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: Colors.white),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("姓名"),
                    title: TextField(
                      decoration: InputDecoration(hintText: "请输入姓名"),
                      textAlign: TextAlign.end,
                      onChanged: (s) {
                        name = s;
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("手机号"),
                    title: TextField(
                      decoration: InputDecoration(hintText: "请输入手机号"),
                      textAlign: TextAlign.end,
                      onChanged: (s) {
                        phone = s;
                      },
                    ),
                  ),
                  if (widget.provider.data.needSubScribe)
                    ListTile(
                      leading: Text("预约时间"),
                      title: Text(
                        date.isEmpty ? "请选择预约时间" : date,
                        textAlign: TextAlign.end,
                      ),
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            currentDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(
                              2060,
                            )).then((date) {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(
                                      hour: widget.provider.hour,
                                      minute: widget.provider.minute))
                              .then((time) {
                            setState(() {
                              this.date =
                                  "${date.toIso8601String().split("T")[0]} ${time.hour}:${time.minute}";
                            });
                          });
                        });
                      },
                    ),
                  ListTile(
                    leading: Text("备注"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 14.w, right: 14.w, bottom: 14.w),
                    child: TextField(
                      onChanged: (s) {
                        remark = s;
                      },
                      maxLines: 10,
                      minLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        hintText: "选填",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                      ),
                    ),
                  ),
                  Container(
                    height: 1.w,
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    color: Colors.black26,
                  ),
                  ListTile(
                    leading: Text("实付金额"),
                    trailing: Text(
                      "￥${(widget.provider.data.sku.goodsPrice.d * widget.provider.totalCount).toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.red),
                    ),
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
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 32.w, left: 14.w, right: 14.w),
              child: InkWell(
                onTap: () {
                  widget.provider.buy(payPrefix, name, phone, date, remark,
                      (oid) {
                    showDialog(barrierDismissible: false,
                        context: context,
                        builder: (c) => AlertDialog(
                              title: Text("订单已生成"),
                              content: Text("您的订单已创建完成"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    }, child: Text("放弃支付")),
                                FlatButton(
                                    onPressed: () {
                                       widget.provider.orderAuth(context,payPrefix,oid);

                                      Navigator.of(context).pop(true);
                                    }, child: Text("去支付")),
                              ],
                            )) ;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "￥${(widget.provider.data.sku.goodsPrice.d * widget.provider.totalCount).toStringAsFixed(2)}\t订单支付",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  height: 45.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
