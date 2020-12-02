import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'mine.g.dart';
@JsonSerializable()
class MainBalance extends Resp{
  BalanceData data;
  MainBalance();
  factory MainBalance.fromJson(Map<String,dynamic>json)=>_$MainBalanceFromJson(json);
}
@JsonSerializable()
class BalanceData{
  String balance;

  BalanceData();
  factory BalanceData.fromJson(Map<String,dynamic>json)=>_$BalanceDataFromJson(json);
}
@JsonSerializable()
class CollectionListResp extends Resp{
  List<CollectionData> data;
  CollectionListResp();
  factory CollectionListResp.fromJson(Map<String,dynamic> json)=>_$CollectionListRespFromJson(json);
}
@JsonSerializable()
class CollectionData{
  String collect_id;
  String user_id;
  String goods_id;
  String goods_name;
  String goods_price;
  @JsonKey(defaultValue: "0")String goods_sales;
  String goods_image;

  CollectionData();
  factory CollectionData.fromJson(Map<String,dynamic> json)=>_$CollectionDataFromJson(json);
}