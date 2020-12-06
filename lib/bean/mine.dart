import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'mine.g.dart';

@JsonSerializable()
class MainBalance extends Resp {
  BalanceData data;

  MainBalance();

  factory MainBalance.fromJson(Map<String, dynamic> json) =>
      _$MainBalanceFromJson(json);
}

@JsonSerializable()
class BalanceData {
  String balance;
  String collect_num;
  String footprint_num;

  BalanceData();

  factory BalanceData.fromJson(Map<String, dynamic> json) =>
      _$BalanceDataFromJson(json);
}

@JsonSerializable()
class CollectionListResp extends Resp {
  List<CollectionData> data;

  CollectionListResp();

  factory CollectionListResp.fromJson(Map<String, dynamic> json) =>
      _$CollectionListRespFromJson(json);
}

@JsonSerializable()
class CollectionData {
  String collect_id;
  String user_id;
  String goods_id;
  String goods_name;
  String goods_price;
  @JsonKey(defaultValue: "0")
  String goods_sales;
  String goods_image;

  CollectionData();

  factory CollectionData.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataFromJson(json);
}

@JsonSerializable()
class FootprintResp extends Resp {
  List<FootprintData> data;

  FootprintResp();

  factory FootprintResp.fromJson(Map<String, dynamic> json) =>
      _$FootprintRespFromJson(json);
}

@JsonSerializable()
class FootprintData {
  String time;
  List<FootprintContent> content;

  FootprintData();

  factory FootprintData.fromJson(Map<String, dynamic> json) =>
      _$FootprintDataFromJson(json);
}

@JsonSerializable()
class FootprintContent {
  String visit_id;
  String user_id;
  String goods_id;
  String goods_name;
  String goods_price;
  String goods_image;
  String create_time;
  String goods_type;
  FootprintContent();

  factory FootprintContent.fromJson(Map<String, dynamic> json) =>
      _$FootprintContentFromJson(json);
}
