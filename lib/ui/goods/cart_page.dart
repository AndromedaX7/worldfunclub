import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/cart_page_provider.dart';

class CartPage extends ProviderWidget<CartPageProvider> {
  CartPage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
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
            onPressed: () {},
            child: Text(
              "text",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (bc, i) => cartListItem(widget.provider.cartList[i]),
        itemCount: widget.provider.cartList.length,
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
                Checkbox(
                  value: goods.isEnabled(),
                  onChanged: (v) => goods.selected = v,
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
                            Text(
                              "${goods.goods_name}",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text("x${goods.total_num}"),
                          ],
                        ),
                        Text("${goods.goods_attr}",style: TextStyle(fontSize: 12.sp,color: Color(0xFFAAAAAA)),),
                        Row(
                          children: [
                            Text("￥${goods.goods_price}",style: TextStyle(color: Color(0xFFE33542),fontSize: 14.sp),),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFEEEEEE),width: 1.w),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.w),bottomLeft: Radius.circular(12.w))
                              ),
                              width: 25.w,
                              height: 22.w,
                              child: Center(child: Icon(Icons.remove,size: 14.w,)),
                            ),
                            Container(
                              width: 32.w,
                              height: 22.w,
                              child: Center(
                                child: Text("${goods.total_num}"),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFEEEEEE),width: 1.w),
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 22.w,
                              child: Center(child: Icon(Icons.add,size: 14.w,)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFEEEEEE),width: 1.w),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(12.w),bottomRight: Radius.circular(12.w))
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
}
