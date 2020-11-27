import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/order_category_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class OrderCategoryPage extends ProviderWidget<OrderCategoryPageProvider> {
  OrderCategoryPage(int state, GoodsType goodsType)
      : super(params: [state, goodsType]);

  @override
  Widget buildContent(BuildContext context) {
    return _OrderCategoryPageContent(mProvider);
  }
}

class _OrderCategoryPageContent extends StatefulWidget {
  final OrderCategoryPageProvider provider;

  _OrderCategoryPageContent(this.provider);

  @override
  _OrderCategoryPageContentState createState() =>
      _OrderCategoryPageContentState();
}

class _OrderCategoryPageContentState extends State<_OrderCategoryPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    widget.provider.loadOrderItem(clearData: true);
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.loadOrderItem();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListWrapper(
      data: widget.provider.orders,
      child: Container(
        color: Color(0xfff5f5f5),
        child: ListView.builder(
          controller: _controller,
          itemCount: widget.provider.orders.length,
          itemBuilder: (bc, i) => buildItem(widget.provider.orders[i]),
        ),
      ),
    );
  }

  Widget buildItem(OrderData data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "images/ic_shop.png",
                width: 16.w,
                height: 16.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "${data.shop_name}",
                style: TextStyle(fontSize: 13.sp),
              ),
              Spacer(),
              Text(
                "${widget.provider.goodsType == GoodsType.self ? data.order_status : data.lh_order_status}",
                style: TextStyle(fontSize: 14.w, color: Color(0xFFFF354D)),
              ),
            ],
          ),
          Column(
            children: data.goods.map((e) => buildGoods(data, e)).toList(),
          )
        ],
      ),
    );
  }

  Widget buildGoods(OrderData data, OrderGoods goods) {
    if (widget.provider.goodsType == GoodsType.self) {
      return Container(
        height: 70.w,
        child: Column(
          children: [
            SizedBox(
              height: 10.w,
            ),
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        goods.image,
                      ),
                    ),
                    border:Border.all(color: Colors.black12) ,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Container(
                    height: 60.w,
                    child: Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(goods.goods_name,style: TextStyle(fontSize: 12.sp,color: Colors.black87),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text(goods.goods_attr,style: TextStyle(fontSize: 12.sp,color: Colors.black26),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Row(
                          children: [
                            Text("￥${goods.goods_price}",style: TextStyle(fontSize: 12.sp,color: Colors.black87) ,),
                            Spacer(),
                            Text("x${goods.total_num}",style: TextStyle(fontSize: 12.sp,color: Colors.black26)),
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
      );
    } else {
      return Container(
        child: Column(),
      );
    }
  }
}
