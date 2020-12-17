import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginBean extends Resp {
  LoginInfo data;

  LoginBean();

  factory LoginBean.fromJson(Map<String, dynamic> json) =>
      _$LoginBeanFromJson(json);

  Map<String,dynamic> toJson()=>_$LoginBeanToJson(this);
}

@JsonSerializable()
class LoginInfo {

  @JsonKey(name: "user_id")
  String userId = "";
  String nickname;
  String avatar;
  @JsonKey(name: "login_token")
  String token;
  @JsonKey(name: "user_mobilebind")
  String hasBindMobilePhone;
  @JsonKey(name: "user_type")
  String userType;
  @JsonKey(name: "mobile_number")
  String mobileNumber;

  LoginInfo();
  Map<String,dynamic> toJson()=>_$LoginInfoToJson(this);
  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
}
