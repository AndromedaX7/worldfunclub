import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginBean extends Resp {
  LoginInfo data;

  LoginBean();

  factory LoginBean.fromJson(Map<String, dynamic> json) =>
      _$LoginBeanFromJson(json);
}

@JsonSerializable()
class LoginInfo {
  String user_id = "";
  String nickname;
  String avatar;
  String login_token;
  String user_mobilebind;
  String user_type;

  LoginInfo();

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
}

