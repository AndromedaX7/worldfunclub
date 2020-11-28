// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) {
  return OrderList()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : OrderData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData()
    ..order_id = json['order_id'] as String
    ..order_no = json['order_no'] as String
    ..goods_num = json['goods_num'] as String
    ..shop_name = json['shop_name'] as String
    ..state_text = json['state_text'] as String
    ..order_status = json['order_status'] as String
    ..lh_order_status = json['lh_order_status'] as String
    ..goods_money = json['goods_money'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) =>
            e == null ? null : OrderGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'order_no': instance.order_no,
      'goods_num': instance.goods_num,
      'shop_name': instance.shop_name,
      'state_text': instance.state_text,
      'order_status': instance.order_status,
      'lh_order_status': instance.lh_order_status,
      'goods_money': instance.goods_money,
      'goods': instance.goods,
    };

OrderGoods _$OrderGoodsFromJson(Map<String, dynamic> json) {
  return OrderGoods()
    ..order_goods_id = json['order_goods_id'] as String
    ..goods_id = json['goods_id'] as String
    ..goods_name = json['goods_name'] as String
    ..goods_price = json['goods_price'] as String
    ..total_num = json['total_num'] as String
    ..image = json['image'] as String
    ..goods_attr = json['goods_attr'] as String;
}

Map<String, dynamic> _$OrderGoodsToJson(OrderGoods instance) =>
    <String, dynamic>{
      'order_goods_id': instance.order_goods_id,
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'goods_price': instance.goods_price,
      'total_num': instance.total_num,
      'image': instance.image,
      'goods_attr': instance.goods_attr,
    };
