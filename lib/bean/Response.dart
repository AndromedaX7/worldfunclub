import 'package:json_annotation/json_annotation.dart';
part 'Response.g.dart';
@JsonSerializable()
class R  {
  R();
  int code ;
  String msg;

  factory R.fromJson(Map<String ,dynamic> map)=>_$RFromJson(map);
  Map<String ,dynamic> toJson() =>_$RToJson(this);
}