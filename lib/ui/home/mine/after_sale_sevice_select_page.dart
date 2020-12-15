import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/after_sale_service_select_page_provider.dart';
import 'package:worldfunclub/widgets/show_image_picker.dart';

class AfterSaleServiceSelectPage
    extends ProviderWidget<AfterSaleServiceSelectPageProvider> {
  final OrderGoods goods;

  AfterSaleServiceSelectPage(this.goods) : super(params: [goods]);

  @override
  Widget buildContent(
      BuildContext context, AfterSaleServiceSelectPageProvider provider) {
    return _AfterSaleServiceSelectPageContent(provider);
  }
}

class _AfterSaleServiceSelectPageContent extends StatefulWidget {
  final AfterSaleServiceSelectPageProvider provider;

  _AfterSaleServiceSelectPageContent(this.provider);

  @override
  _AfterSaleServiceSelectPageContentState createState() =>
      _AfterSaleServiceSelectPageContentState();
}

class _AfterSaleServiceSelectPageContentState
    extends State<_AfterSaleServiceSelectPageContent> {
  TextEditingController _controller;
  double price = 0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  bool show = false;
  String showText = "";
  String reason = "";
  String remark = "";

  @override
  void initState() {
    super.initState();
    widget.provider.loadRefundReason();
    price = (widget.provider.goods.goodsPrice.d *
        widget.provider.goods.totalNum.integer);
    _controller = TextEditingController.fromValue(TextEditingValue(
        // 设置内容
        text: price.toStringAsFixed(2),
        // 保持光标在最后
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: price.toStringAsFixed(2).length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("售后服务"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 4))
                ],
              ),
              height: 145.w,
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
              margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "售后商品",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              widget.provider.goods.image,
                            ),
                          ),
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 90.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.provider.goods.goodsName,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black87),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                widget.provider.goods.goodsAttr,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black26),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "￥${widget.provider.goods.goodsPrice}",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black87),
                                  ),
                                  Spacer(),
                                  Text("x${widget.provider.goods.totalNum}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black26)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 4))
                ],
                borderRadius: BorderRadius.circular(16.w),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "售后信息",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      key.currentState.showBottomSheet(
                        (c) => Container(
                          width: 375.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.w)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, -2),
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ],
                          ),
                          height: 450.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.w),
                                child: Text("售后类型"),
                              ),
                              ListTile(
                                title: Text(
                                  "我要退款",
                                  style: TextStyle(
                                      color:
                                          !show ? Colors.red : Colors.black54),
                                ),
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                    showText = "仅退款";
                                    show = false;
                                  });
                                },
                              ),
                              ListTile(
                                title: Text("我要退货退款",
                                    style: TextStyle(
                                        color: show
                                            ? Colors.red
                                            : Colors.black54)),
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                    showText = "退货退款";
                                    show = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 8.w),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(text: "售后类型", children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red))
                            ]),
                          ),
                          Spacer(),
                          Text(
                            "${showText.isEmpty ? "请选择" : showText}",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Icon(Icons.navigate_next, color: Colors.black26),
                        ],
                      ),
                    ),
                  ),
                  if (show)
                    GestureDetector(
                      onTap: () {
                        key.currentState
                            .showBottomSheet((c) => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16.w)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, -2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  height: 450.w,
                                ))
                            .closed;
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 8.w),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(text: "是否退货", children: [
                                TextSpan(
                                    text: "*",
                                    style: TextStyle(color: Colors.red))
                              ]),
                            ),
                            Spacer(),
                            Text(
                              "请选择",
                              style: TextStyle(color: Colors.black26),
                            ),
                            Icon(Icons.navigate_next, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      key.currentState.showBottomSheet(
                        (c) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.w)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, -2),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ]),
                          height: 450.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.w),
                                child: Text("退款原因"),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      widget.provider.refundReason.length,
                                  itemBuilder: (c, i) => ListTile(
                                    title: Text(
                                      "${widget.provider.refundReason[i]}",
                                      style: TextStyle(
                                          color: reason ==
                                                  widget
                                                      .provider.refundReason[i]
                                              ? Colors.red
                                              : Colors.black54),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        reason =
                                            widget.provider.refundReason[i];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 8.w),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(text: "退款原因", children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red))
                            ]),
                          ),
                          Spacer(),
                          Text(
                            "${reason.isEmpty ? "请选择" : reason}",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Icon(Icons.navigate_next, color: Colors.black26),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.w),
                          child: Text.rich(
                            TextSpan(text: "退款金额", children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red)),
                              TextSpan(
                                  text:
                                      "\n可修改，最多￥${(widget.provider.goods.goodsPrice.d * widget.provider.goods.totalNum.integer).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 10.sp))
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (s) {
                              price = s.d;
                            },
                            controller: _controller,
                            textAlign: TextAlign.end,
                            maxLength: 10,
                            style: TextStyle(color: Colors.red),
                            decoration: InputDecoration(
                                prefix: Text(
                                  "￥",
                                  style: TextStyle(color: Colors.red),
                                ),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 4))
                ],
                borderRadius: BorderRadius.circular(16.w),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
              margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "补充描述和凭证",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  TextField(
                    onChanged: (s) {
                      remark = s;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLength: 200,
                    minLines: 1,
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "补充描述，有助于商家更好的处理售后问题",
                        labelStyle: TextStyle(color: Colors.black26)),
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  Container(
                    height: 120.w,
                    child: GridView.builder(
                      itemCount: widget.provider.images.length < 3
                          ? widget.provider.images.length + 1
                          : widget.provider.images.length,
                      itemBuilder: (c, i) => _imageList(
                          i,
                          widget.provider.images.length < 3
                              ? (i == 0 ? null : widget.provider.images[i - 1])
                              : widget.provider.images[i]),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1, crossAxisCount: 3),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "提交售后服务",
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          widget.provider.refund(context, show, showText, price, remark);
        },
      ),
    );
  }

  Widget _imageList(int index, File path) {
    if (widget.provider.images.length < 3) {
      if (index == 0) {
        return InkWell(
          onTap: () {
            showImagePicker(context, (file) {
              widget.provider.addImages(File(file));
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
            color: Color(0xfffafafa),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black26,
                ),
                Text(
                  "上传凭证\n(最多3张)",
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
        );
      } else
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
          child: Image.memory(
            path.readAsBytesSync(),
            fit: BoxFit.fill,
          ),
        );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
        child: Image.memory(
          path.readAsBytesSync(),
          fit: BoxFit.fill,
        ),
      );
    }
  }
}
