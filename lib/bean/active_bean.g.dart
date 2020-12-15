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
    ..activityId = json['activity_id'] as String
    ..activityName = json['activity_name'] as String
    ..activitySign = json['activity_sign'] as String
    ..type = json['type'] as String
    ..imageId = json['image_id'] as String
    ..sort = json['sort'] as String
    ..isDelete = json['is_delete'] as String
    ..createTime = json['create_time'] as String
    ..updateTime = json['update_time'] as String
    ..image = json['image'] == null
        ? null
        : HomeCategoryImage.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ActiveItemToJson(ActiveItem instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'activity_name': instance.activityName,
      'activity_sign': instance.activitySign,
      'type': instance.type,
      'image_id': instance.imageId,
      'sort': instance.sort,
      'is_delete': instance.isDelete,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
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
