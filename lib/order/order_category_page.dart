import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderCategoryPage extends StatefulWidget {
  final int state;
  final GoodsType goodsType;

  OrderCategoryPage(this.state, this.goodsType);

  @override
  _OrderCategoryPageState createState() => _OrderCategoryPageState();
}

class _OrderCategoryPageState extends State<OrderCategoryPage> {
  List<OrderData> orders =List();

  @override
  void initState() {
    super.initState();
    api.orderList(1, widget.goodsType == GoodsType.self
        ? OrderType.fromIndex(widget.state)
        : OrderType.fromLive(widget.state)).listen((event) {
      var list = OrderList.fromJson(event);
      if(list.code ==1 ){
        setState(() {
          orders.addAll(list.data);
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xfff5f5f5),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (bc, i) => buildItem(orders[i]),
      ),
    );
  }

  Widget buildItem(OrderData data) {
    return Container( 
      margin: EdgeInsets.symmetric(vertical: 8.w,horizontal: 14.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),

      child:Column(
        children: [
          Row(
            children: [
              Image.asset("images/ic_shop.png",width:16.w,height:16.w,fit: BoxFit.fill,),
              SizedBox(width: 8.w,),
              Text("${data.shop_name}",style: TextStyle(fontSize: 13.sp),),
              Spacer(),
              Text("${widget.goodsType==GoodsType.self?data.order_status:data.lh_order_status}",style: TextStyle(fontSize: 14.w,color: Color(0xFFFF354D)),),
            ],
          ),
          Column(
            children:  data.goods.map((e) => buildGoods(data,e)).toList(),
          )
        ],
      ),
    );
  }
  Widget buildGoods(OrderData data ,OrderGoods goods){
    List<Widget> goodsItems=List();
    goodsItems.add( Container());
    if(widget.goodsType==GoodsType.self){
      if(data.order_status== OrderType.willEvaluation.value ){
        goodsItems.add(Container(
          height: 10,
          color: Colors.red,
        ));
      }
    }

    return Container(
      child: Column(
        children: goodsItems,
      ),
    );
  }
}
