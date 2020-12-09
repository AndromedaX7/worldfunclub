import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/express_page_provider.dart';

class ExpressPage extends ProviderWidget<ExpressPageProvider> {
  ExpressPage(String orderId, String orderGoodsId)
      : super(params: [orderId, orderGoodsId]);

  @override
  Widget buildContent(BuildContext context, ExpressPageProvider provider) {
    return _ExpressPageContent(provider);
  }
}

class _ExpressPageContent extends StatefulWidget {
  final ExpressPageProvider provider;

  _ExpressPageContent(this.provider);

  @override
  _ExpressPageContentState createState() => _ExpressPageContentState();
}

class _ExpressPageContentState extends State<_ExpressPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadExpressLine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("物流信息"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 14.w),
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 14.w),
            child: Row(
              children: [
                Image.network(
                  widget.provider.goodsImage,
                  fit: BoxFit.fill,
                  width: 65.w,
                  height: 65.w,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "快递公司：${widget.provider.deliveryName}",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),
                    Text(
                      "快递单号：${widget.provider.deliveryNo}",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
            height: 101.w,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.provider.deliveryList.length,
              itemBuilder: (c, i) =>
                  _expressLine(widget.provider.deliveryList[i], i),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expressLine(ExpressDeliveryList item, int index) {
    if (index == 0) {
      return Container(
        padding: EdgeInsets.only(top: 14.w,right: 14.w),
        color: Colors.white,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              child: Column(
                children: [
                  Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                    ),
                  ),
                  Container(
                    width: 2.w,
                    height: 72.w,
                    color: Colors.black12,
                  )
                ],
              ),
            ),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.max,
              children: [
                Text("${item.context}",style: TextStyle(color: Colors.red),),
                Text("${item.time}",style: TextStyle(color: Colors.red),),
              ],
            ),
            ),
          ],
        ),
      );
    } else if (index == widget.provider.deliveryList.length - 1) {
      return Container(
        padding: EdgeInsets.only(top: 0, right: 14.w),
        color: Colors.white,
        child: Row( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              child: Column(
                children: [
                  Container(
                    width: 2.w,
                    height: 8.w,
                    color: Colors.black12,
                  ),
                  Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12
                    ),
                  ),
                  SizedBox(height: 60.w,)
                ],
              ),
            ),
            Expanded(child: Text("${item.context}")),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(right: 14.w),
        color: Colors.white,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              child: Column(
                children: [
                  Container(
                    width: 2.w,
                    height: 72.w,
                    color: Colors.black12,
                  ),

                ],
              ),
            ),
            Expanded(child: Text("${item.context}")),
          ],
        ),
      );
    }
  }
}
