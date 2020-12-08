// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WriteOffResp _$WriteOffRespFromJson(Map<String, dynamic> json) {
  return WriteOffResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : WriteOffData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WriteOffRespToJson(WriteOffResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

WriteOffData _$WriteOffDataFromJson(Map<String, dynamic> json) {
  return WriteOffData()
    ..orderId = json['order_id'] as String
    ..orderNo = json['order_no'] as String
    ..totalPrice = json['total_price'] as String
    ..shopName = json['shop_name'] as String
    ..stateText = json['state_text'] as String
    ..orderStatus = json['lh_order_status'] as String
    ..startTime = json['lh_start_time'] as String
    ..endTime = json['lh_end_time'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) => e == null
            ? null
            : WriteOffGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WriteOffDataToJson(WriteOffData instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'total_price': instance.totalPrice,
      'shop_name': instance.shopName,
      'state_text': instance.stateText,
      'lh_order_status': instance.orderStatus,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
      'goods': instance.goods,
    };

WriteOffGoods _$WriteOffGoodsFromJson(Map<String, dynamic> json) {
  return WriteOffGoods()
    ..orderGoodsId = json['order_goods_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..price = json['goods_price'] as String
    ..totalNumber = json['total_num'] as String
    ..image = json['image'] as String
    ..goodsAttr = json['goods_attr'] as String;
}

Map<String, dynamic> _$WriteOffGoodsToJson(WriteOffGoods instance) =>
    <String, dynamic>{
      'order_goods_id': instance.orderGoodsId,
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'goods_price': instance.price,
      'total_num': instance.totalNumber,
      'image': instance.image,
      'goods_attr': instance.goodsAttr,
    };

ShopBalanceResp _$ShopBalanceRespFromJson(Map<String, dynamic> json) {
  return ShopBalanceResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : ShopBalanceData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ShopBalanceRespToJson(ShopBalanceResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ShopBalanceData _$ShopBalanceDataFromJson(Map<String, dynamic> json) {
  return ShopBalanceData()..shopBalance = json['shop_balance'] as String;
}

Map<String, dynamic> _$ShopBalanceDataToJson(ShopBalanceData instance) =>
    <String, dynamic>{
      'shop_balance': instance.shopBalance,
    };