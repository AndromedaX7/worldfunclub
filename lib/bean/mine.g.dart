// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainBalance _$MainBalanceFromJson(Map<String, dynamic> json) {
  return MainBalance()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : BalanceData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MainBalanceToJson(MainBalance instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

BalanceData _$BalanceDataFromJson(Map<String, dynamic> json) {
  return BalanceData()..balance = json['balance'] as String;
}

Map<String, dynamic> _$BalanceDataToJson(BalanceData instance) =>
    <String, dynamic>{
      'balance': instance.balance,
    };

CollectionListResp _$CollectionListRespFromJson(Map<String, dynamic> json) {
  return CollectionListResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CollectionData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CollectionListRespToJson(CollectionListResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CollectionData _$CollectionDataFromJson(Map<String, dynamic> json) {
  return CollectionData()
    ..collect_id = json['collect_id'] as String
    ..user_id = json['user_id'] as String
    ..goods_id = json['goods_id'] as String
    ..goods_name = json['goods_name'] as String
    ..goods_price = json['goods_price'] as String
    ..goods_sales = json['goods_sales'] as String ?? '0'
    ..goods_image = json['goods_image'] as String;
}

Map<String, dynamic> _$CollectionDataToJson(CollectionData instance) =>
    <String, dynamic>{
      'collect_id': instance.collect_id,
      'user_id': instance.user_id,
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'goods_price': instance.goods_price,
      'goods_sales': instance.goods_sales,
      'goods_image': instance.goods_image,
    };
