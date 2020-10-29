import 'package:json_annotation/json_annotation.dart';
part "region.g.dart";
@JsonSerializable()
class RegionData{
  RegionData();
  int code ;
  String msg;
  List<RegionInfo> data;

  factory RegionData.fromJson(Map<String,dynamic>json)=>_$RegionDataFromJson(json);
}
@JsonSerializable()
class RegionInfo{
  RegionInfo();
  String id;
  String name;
  List<RegionInfo> children;
  factory RegionInfo.fromJson(Map<String,dynamic>json)=>_$RegionInfoFromJson(json);
}