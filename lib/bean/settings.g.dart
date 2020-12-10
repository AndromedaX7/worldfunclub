// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePhoneResp _$ChangePhoneRespFromJson(Map<String, dynamic> json) {
  return ChangePhoneResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : ChangePhoneData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ChangePhoneRespToJson(ChangePhoneResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ChangePhoneData _$ChangePhoneDataFromJson(Map<String, dynamic> json) {
  return ChangePhoneData()..mobile = json['mobile_number'] as String;
}

Map<String, dynamic> _$ChangePhoneDataToJson(ChangePhoneData instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobile,
    };
