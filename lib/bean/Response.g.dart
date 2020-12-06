// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

R _$RFromJson(Map<String, dynamic> json) {
  return R()
    ..code = json['code'] as int
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$RToJson(R instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
    };
