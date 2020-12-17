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
  return BalanceData()
    ..balance = json['balance'] as String
    ..collectNum = json['collect_num'] as String
    ..footprintNum = json['footprint_num'] as String;
}

Map<String, dynamic> _$BalanceDataToJson(BalanceData instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'collect_num': instance.collectNum,
      'footprint_num': instance.footprintNum,
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
    ..collectId = json['collect_id'] as String
    ..userId = json['user_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..goodsPrice = json['goods_price'] as String
    ..goodsSales = json['goods_sales'] as String ?? '0'
    ..goodsImage = json['goods_image'] as String;
}

Map<String, dynamic> _$CollectionDataToJson(CollectionData instance) =>
    <String, dynamic>{
      'collect_id': instance.collectId,
      'user_id': instance.userId,
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'goods_price': instance.goodsPrice,
      'goods_sales': instance.goodsSales,
      'goods_image': instance.goodsImage,
    };

FootprintResp _$FootprintRespFromJson(Map<String, dynamic> json) {
  return FootprintResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : FootprintData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FootprintRespToJson(FootprintResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

FootprintData _$FootprintDataFromJson(Map<String, dynamic> json) {
  return FootprintData()
    ..time = json['time'] as String
    ..content = (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : FootprintContent.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FootprintDataToJson(FootprintData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'content': instance.content,
    };

FootprintContent _$FootprintContentFromJson(Map<String, dynamic> json) {
  return FootprintContent()
    ..visitId = json['visit_id'] as String
    ..userId = json['user_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..goodsPrice = json['goods_price'] as String
    ..goodsImage = json['goods_image'] as String
    ..createTime = json['create_time'] as String
    ..goodsType = json['goods_type'] as String;
}

Map<String, dynamic> _$FootprintContentToJson(FootprintContent instance) =>
    <String, dynamic>{
      'visit_id': instance.visitId,
      'user_id': instance.userId,
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'goods_price': instance.goodsPrice,
      'goods_image': instance.goodsImage,
      'create_time': instance.createTime,
      'goods_type': instance.goodsType,
    };
