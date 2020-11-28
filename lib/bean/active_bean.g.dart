// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveList _$ActiveListFromJson(Map<String, dynamic> json) {
  return ActiveList()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ActiveItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActiveListToJson(ActiveList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ActiveItem _$ActiveItemFromJson(Map<String, dynamic> json) {
  return ActiveItem()
    ..activity_id = json['activity_id'] as String
    ..activity_name = json['activity_name'] as String
    ..activity_sign = json['activity_sign'] as String
    ..type = json['type'] as String
    ..image_id = json['image_id'] as String
    ..sort = json['sort'] as String
    ..is_delete = json['is_delete'] as String
    ..create_time = json['create_time'] as String
    ..update_time = json['update_time'] as String
    ..image = json['image'] == null
        ? null
        : HomeCategoryImage.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ActiveItemToJson(ActiveItem instance) =>
    <String, dynamic>{
      'activity_id': instance.activity_id,
      'activity_name': instance.activity_name,
      'activity_sign': instance.activity_sign,
      'type': instance.type,
      'image_id': instance.image_id,
      'sort': instance.sort,
      'is_delete': instance.is_delete,
      'create_time': instance.create_time,
      'update_time': instance.update_time,
      'image': instance.image,
    };

ActiveGoodsList _$ActiveGoodsListFromJson(Map<String, dynamic> json) {
  return ActiveGoodsList()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ActiveGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActiveGoodsListToJson(ActiveGoodsList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ActiveGoods _$ActiveGoodsFromJson(Map<String, dynamic> json) {
  return ActiveGoods()
    ..itemId = json['itemId'] as String
    ..itemTitle = json['itemTitle'] as String
    ..itemPicture = json['itemPicture'] as String
    ..itemSmallPictures =
        (json['itemSmallPictures'] as List)?.map((e) => e as String)?.toList()
    ..itemVolume = json['itemVolume'] as String
    ..itemUrl = json['itemUrl'] as String
    ..itemPrice = json['itemPrice'] as String
    ..couponPrice = json['couponPrice'] as String
    ..coupon = json['coupon'] as String
    ..itemFinalPrice = json['itemFinalPrice'] as String
    ..commissionRate = json['commissionRate'] as String
    ..commissionAmount = json['commissionAmount'] as String
    ..sellerName = json['sellerName'] as String;
}

Map<String, dynamic> _$ActiveGoodsToJson(ActiveGoods instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemTitle': instance.itemTitle,
      'itemPicture': instance.itemPicture,
      'itemSmallPictures': instance.itemSmallPictures,
      'itemVolume': instance.itemVolume,
      'itemUrl': instance.itemUrl,
      'itemPrice': instance.itemPrice,
      'couponPrice': instance.couponPrice,
      'coupon': instance.coupon,
      'itemFinalPrice': instance.itemFinalPrice,
      'commissionRate': instance.commissionRate,
      'commissionAmount': instance.commissionAmount,
      'sellerName': instance.sellerName,
    };
