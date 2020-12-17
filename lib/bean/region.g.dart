// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionData _$RegionDataFromJson(Map<String, dynamic> json) {
  return RegionData()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : RegionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RegionDataToJson(RegionData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

RegionInfo _$RegionInfoFromJson(Map<String, dynamic> json) {
  return RegionInfo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : RegionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RegionInfoToJson(RegionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'children': instance.children,
    };
