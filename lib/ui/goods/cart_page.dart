import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/order_create_page.dart';
import 'package:worldfunclub/vm/cart_page_provider.dart';

class CartPage extends ProviderWidget<CartPageProvider> {
  CartPage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _CartPageContent(mProvider);
  }
}

class _CartPageContent extends StatefulWidget {
  final CartPageProvider provider;

  _CartPageContent(this.provider);

  @override
  _CartPageContentState createState() => _CartPageContentState();
}

class _CartPageContentState extends State<_CartPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.carts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                widget.provider.isEdit = !widget.provider.isEdit;
              });
            },
            child: Text(
              widget.provider.isEdit ? "完成" : "编辑",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (bc, i) => cartListItem(widget.provider.cartList[i]),
              itemCount: widget.provider.cartList.length,
            ),
          ),
          Container(
            height: 60.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -2),
                    blurRadius: 2,
                    spreadRadius: 2)
              ],
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                GestureDetector(
                  onTap: () {
                    widget.provider.cartList.forEach((element) {
                      if (element.isEnabled()) {
                        element.selected = !widget.provider.checkAll;
                      }
                    });
                    setState(() {
                      widget.provider.checkAll = !widget.provider.checkAll;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    child: allCheck(),
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "全选",
                  style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                ),
                Spacer(),
                if (!widget.provider.isEdit)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "合计：",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 14.sp),
                          children: [
                            TextSpan(
                                text: "￥",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.red)),
                            TextSpan(
                                text: "${widget.provider.checkAllPrice}",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.red)),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "已减",
                          style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                          children: [
                            TextSpan(
                              text: "￥0.00  优惠明细",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 9.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    if (widget.provider.isEdit) {
                      widget.provider.deleteCarts();
                    } else {
                      List<GoodsListBean> sel =[];
                      if (widget.provider.checkCount > 0){
                        widget.provider.cartList.forEach((element) {
                          if(element.selected){
                            sel.add(element);
                          }
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => OrderCreatePage(sel)));
                      }

                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.w),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(19.w)),
                    child: Text(
                      "${widget.provider.isEdit ? "删除" : "去结算"}(${widget.provider.checkCount})",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cartListItem(GoodsListBean goods) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.w),
      child: GestureDetector(
        child: Card(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.w),
            child: Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                GestureDetector(
                  onTap: () {
                    if (goods.isEnabled()) {
                      setState(() {
                        goods.selected = !goods.selected;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    child: checkWidget(goods),
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Image.network(
                  goods.goods_image,
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
                                "${goods.goods_name}",
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
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                widget.provider.increaseCartNum(false, goods,
                                    (success) {
                                  setState(() {
                                    Fluttertoast.showToast(
                                        msg: "操作${success ? "成功" : "失败"}");
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFEEEEEE), width: 1.w),
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
                                child: Text("${goods.total_num}"),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFEEEEEE), width: 1.w),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.provider.increaseCartNum(true, goods,
                                    (success) {
                                  setState(() {
                                    Fluttertoast.showToast(
                                        msg: "操作${success ? "成功" : "失败"}");
                                  });
                                });
                              },
                              child: Container(
                                width: 25.w,
                                height: 22.w,
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 14.w,
                                )),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFEEEEEE), width: 1.w),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12.w),
                                        bottomRight: Radius.circular(12.w))),
                              ),
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

  Widget checkWidget(GoodsListBean goods) {
    if (goods.isEnabled()) {
      if (goods.selected) {
        return Image.asset(
          "images/ic_things_check.webp",
          fit: BoxFit.fill,
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5.w),
            borderRadius: BorderRadius.circular(18.w),
          ),
          width: 22.w,
          height: 22.w,
        );
      }
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          border: Border.all(color: Colors.grey, width: 0.5.w),
          borderRadius: BorderRadius.circular(18.w),
        ),
        width: 22.w,
        height: 22.w,
      );
    }
  }

  Widget allCheck() {
    int checkCount = 0;
    int disableCount = 0;
    widget.provider.checkCount = 0;
    widget.provider.checkAllPrice = "0.00";
    widget.provider.cartList.forEach((element) {
      if (element.selected) {
        checkCount++;
        widget.provider.checkAllPrice = (widget.provider.checkAllPrice.d +
                element.goods_price.d * element.total_num.integer)
            .toStringAsFixed(2);
        widget.provider.checkCount = checkCount;
      }

      if (!element.isEnabled()) {
        disableCount++;
      }
    });

    if (widget.provider.cartList.length - disableCount == checkCount &&checkCount != 0) {
      widget.provider.checkAll = true;
      return Image.asset(
        "images/ic_things_check.webp",
        fit: BoxFit.fill,
      );
    } else {
      widget.provider.checkAll = false;
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5.w),
          borderRadius: BorderRadius.circular(18.w),
        ),
        width: 22.w,
        height: 22.w,
      );
    }
  }
}