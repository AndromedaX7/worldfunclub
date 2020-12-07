import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'settings.g.dart';
@JsonSerializable()
class ChangePhoneResp extends Resp {
  ChangePhoneData data;
  ChangePhoneResp();
 factory ChangePhoneResp. fromJson(Map<String,dynamic>event) =>_$ChangePhoneRespFromJson(event);
  Map<String,dynamic> toJson()=>_$ChangePhoneRespToJson(this);
}

@JsonSerializable()
class ChangePhoneData {
  @JsonKey(name: "mobile_number")
  String mobile;
  ChangePhoneData();
  factory ChangePhoneData. fromJson(Map<String,dynamic>event) =>_$ChangePhoneDataFromJson(event);
  Map<String,dynamic> toJson()=>_$ChangePhoneDataToJson(this);
}
