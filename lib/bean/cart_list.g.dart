// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartBean _$CartBeanFromJson(Map<String, dynamic> json) {
  return CartBean()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : CartData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CartBeanToJson(CartBean instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) {
  return CartData()
    ..orderTotalNum = json['order_total_num'] as String
    ..payType = json['pay_type'] as String
    ..orderTotalPrice = json['order_total_price'] as String
    ..couponId = json['coupon_id'] as String
    ..couponMoney = json['coupon_money'] as String
    ..orderPrice = json['order_price'] as String
    ..orderPayPrice = json['order_pay_price'] as String
    ..goodsList = (json['goods_list'] as List)
        ?.map((e) => e == null
            ? null
            : GoodsListBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'order_total_num': instance.orderTotalNum,
      'pay_type': instance.payType,
      'order_total_price': instance.orderTotalPrice,
      'coupon_id': instance.couponId,
      'coupon_money': instance.couponMoney,
      'order_price': instance.orderPrice,
      'order_pay_price': instance.orderPayPrice,
      'goods_list': instance.goodsList,
    };

GoodsListBean _$GoodsListBeanFromJson(Map<String, dynamic> json) {
  return GoodsListBean()
    ..enabled = json['enabled'] as bool ?? true
    ..selected = json['selected'] as bool ?? false
    ..start_time = json['start_time'] as String
    ..end_time = json['end_time'] as String
    ..cart_id = json['cart_id'] as String
    ..goods_id = json['goods_id'] as String
    ..goods_sku_id = json['goods_sku_id'] as String
    ..goods_name = json['goods_name'] as String
    ..goods_image = json['goods_image'] as String
    ..goods_type = json['goods_type'] as String
    ..spec_type = json['spec_type'] as String
    ..goods_attr = json['goods_attr'] as String
    ..goods_price = json['goods_price'] as String
    ..line_price = json['line_price'] as String
    ..stock_num = json['stock_num'] as String
    ..shop_id = json['shop_id'] as String
    ..shop_name = json['shop_name'] as String
    ..total_num = json['total_num'] as String
    ..total_price = json['total_price'] as String
    ..is_user_grade = json['is_user_grade'] as String
    ..grade_ratio = json['grade_ratio'] as String
    ..grade_goods_price = json['grade_goods_price'] as String
    ..grade_total_money = json['grade_total_money'] as String
    ..coupon_money = json['coupon_money'] as String
    ..total_pay_price = json['total_pay_price'] as String
    ..points_bonus = json['points_bonus'] as String;
}

Map<String, dynamic> _$GoodsListBeanToJson(GoodsListBean instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'selected': instance.selected,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'cart_id': instance.cart_id,
      'goods_id': instance.goods_id,
      'goods_sku_id': instance.goods_sku_id,
      'goods_name': instance.goods_name,
      'goods_image': instance.goods_image,
      'goods_type': instance.goods_type,
      'spec_type': instance.spec_type,
      'goods_attr': instance.goods_attr,
      'goods_price': instance.goods_price,
      'line_price': instance.line_price,
      'stock_num': instance.stock_num,
      'shop_id': instance.shop_id,
      'shop_name': instance.shop_name,
      'total_num': instance.total_num,
      'total_price': instance.total_price,
      'is_user_grade': instance.is_user_grade,
      'grade_ratio': instance.grade_ratio,
      'grade_goods_price': instance.grade_goods_price,
      'grade_total_money': instance.grade_total_money,
      'coupon_money': instance.coupon_money,
      'total_pay_price': instance.total_pay_price,
      'points_bonus': instance.points_bonus,
    };
