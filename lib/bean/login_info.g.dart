// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBean _$LoginBeanFromJson(Map<String, dynamic> json) {
  return LoginBean()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : LoginInfo.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginBeanToJson(LoginBean instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  return LoginInfo()
    ..userId = json['user_id'] as String
    ..nickname = json['nickname'] as String
    ..avatar = json['avatar'] as String
    ..token = json['login_token'] as String
    ..hasBindMobilePhone = json['user_mobilebind'] as String
    ..userType = json['user_type'] as String
    ..mobileNumber = json['mobile_number'] as String;
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'user_id': instance.userId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'login_token': instance.token,
      'user_mobilebind': instance.hasBindMobilePhone,
      'user_type': instance.userType,
      'mobile_number': instance.mobileNumber,
    };
