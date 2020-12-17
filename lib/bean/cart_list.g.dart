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
    ..startTime = json['start_time'] as String
    ..endTime = json['end_time'] as String
    ..cartId = json['cart_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsSkuId = json['goods_sku_id'] as String
    ..goodsName = json['goods_name'] as String
    ..goodsImage = json['goods_image'] as String
    ..goodsType = json['goods_type'] as String
    ..specType = json['spec_type'] as String
    ..goodsAttr = json['goods_attr'] as String
    ..goodsPrice = json['goods_price'] as String
    ..linePrice = json['line_price'] as String
    ..stockNum = json['stock_num'] as String
    ..shopId = json['shop_id'] as String
    ..shopName = json['shop_name'] as String
    ..totalNum = json['total_num'] as String
    ..totalPrice = json['total_price'] as String
    ..isUserGrade = json['is_user_grade'] as String
    ..gradeRatio = json['grade_ratio'] as String
    ..gradeGoodsPrice = json['grade_goods_price'] as String
    ..gradeTotalMoney = json['grade_total_money'] as String
    ..couponMoney = json['coupon_money'] as String
    ..totalPayPrice = json['total_pay_price'] as String
    ..pointsBonus = json['points_bonus'] as String;
}

Map<String, dynamic> _$GoodsListBeanToJson(GoodsListBean instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'selected': instance.selected,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'cart_id': instance.cartId,
      'goods_id': instance.goodsId,
      'goods_sku_id': instance.goodsSkuId,
      'goods_name': instance.goodsName,
      'goods_image': instance.goodsImage,
      'goods_type': instance.goodsType,
      'spec_type': instance.specType,
      'goods_attr': instance.goodsAttr,
      'goods_price': instance.goodsPrice,
      'line_price': instance.linePrice,
      'stock_num': instance.stockNum,
      'shop_id': instance.shopId,
      'shop_name': instance.shopName,
      'total_num': instance.totalNum,
      'total_price': instance.totalPrice,
      'is_user_grade': instance.isUserGrade,
      'grade_ratio': instance.gradeRatio,
      'grade_goods_price': instance.gradeGoodsPrice,
      'grade_total_money': instance.gradeTotalMoney,
      'coupon_money': instance.couponMoney,
      'total_pay_price': instance.totalPayPrice,
      'points_bonus': instance.pointsBonus,
    };
