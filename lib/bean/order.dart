import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderList extends Resp{
  OrderList();
  List<OrderData> data;
  factory OrderList.fromJson(Map<String ,dynamic>json)=>_$OrderListFromJson(json);
}
@JsonSerializable()
class OrderData{
  String order_id;
  String order_no;
  String goods_num;
  String shop_name;
  String state_text;
  String order_status;
  String lh_order_status;
  String goods_money;
  List<OrderGoods> goods;
  OrderData();
  factory OrderData.fromJson(Map<String ,dynamic>json)=>_$OrderDataFromJson(json);
}
@JsonSerializable()
class OrderGoods{
  String order_goods_id;
  String goods_id;
  String goods_name;
  String goods_price;
  String total_num;
  String image;
  String goods_attr;
  OrderGoods();
  factory OrderGoods.fromJson(Map<String ,dynamic>json)=>_$OrderGoodsFromJson(json);
}