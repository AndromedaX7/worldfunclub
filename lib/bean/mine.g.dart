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
