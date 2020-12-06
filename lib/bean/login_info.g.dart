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
    ..user_id = json['user_id'] as String
    ..nickname = json['nickname'] as String
    ..avatar = json['avatar'] as String
    ..login_token = json['login_token'] as String
    ..user_mobilebind = json['user_mobilebind'] as String
    ..user_type = json['user_type'] as String;
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'login_token': instance.login_token,
      'user_mobilebind': instance.user_mobilebind,
      'user_type': instance.user_type,
    };
