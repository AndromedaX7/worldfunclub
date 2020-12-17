import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'pay.g.dart';
@JsonSerializable()
class PayResp extends Resp{
    dynamic data;
    PayResp();
    factory PayResp.fromJson(Map<String ,dynamic>json)=>_$PayRespFromJson(json);
    Map<String,dynamic> toJson()=>_$PayRespToJson(this);
}

// @JsonSerializable()
// class PayData extends Resp{
//   String appid;
//   String partnerid;
//   String prepayid;
//   String package;
//   String timestamp;
//   String noncestr;
//   String sign;
//   String pay_type;
//
//   PayData();
//   factory PayData.fromJson(Map<String ,dynamic>json)=>_$PayDataFromJson(json);
// }