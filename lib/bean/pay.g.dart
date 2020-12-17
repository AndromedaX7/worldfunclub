// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayResp _$PayRespFromJson(Map<String, dynamic> json) {
  return PayResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$PayRespToJson(PayResp instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
