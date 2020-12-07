import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'mine.g.dart';

@JsonSerializable()
class MainBalance extends Resp {
  BalanceData data;

  MainBalance();

  Map<String, dynamic> toJson() => _$MainBalanceToJson(this);

  factory MainBalance.fromJson(Map<String, dynamic> json) =>
      _$MainBalanceFromJson(json);
}

@JsonSerializable()
class BalanceData {
  String balance;
  @JsonKey(name: "collect_num")
  String collectNum;
  @JsonKey(name: "footprint_num")
  String footprintNum;

  BalanceData();

  Map<String, dynamic> toJson() => _$BalanceDataToJson(this);

  factory BalanceData.fromJson(Map<String, dynamic> json) =>
      _$BalanceDataFromJson(json);
}

@JsonSerializable()
class CollectionListResp extends Resp {
  List<CollectionData> data;

  CollectionListResp();

  Map<String, dynamic> toJson() => _$CollectionListRespToJson(this);

  factory CollectionListResp.fromJson(Map<String, dynamic> json) =>
      _$CollectionListRespFromJson(json);
}

@JsonSerializable()
class CollectionData {
  @JsonKey(name: "collect_id")
  String collectId;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "goods_price")
  String goodsPrice;
  @JsonKey(defaultValue: "0", name: "goods_sales")
  String goodsSales;
  @JsonKey(name: "goods_image")
  String goodsImage;

  CollectionData();

  Map<String, dynamic> toJson() => _$CollectionDataToJson(this);

  factory CollectionData.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataFromJson(json);
}

@JsonSerializable()
class FootprintResp extends Resp {
  List<FootprintData> data;

  FootprintResp();

  Map<String, dynamic> toJson() => _$FootprintRespToJson(this);

  factory FootprintResp.fromJson(Map<String, dynamic> json) =>
      _$FootprintRespFromJson(json);
}

@JsonSerializable()
class FootprintData {
  String time;
  List<FootprintContent> content;

  FootprintData();

  Map<String, dynamic> toJson() => _$FootprintDataToJson(this);

  factory FootprintData.fromJson(Map<String, dynamic> json) =>
      _$FootprintDataFromJson(json);
}

@JsonSerializable()
class FootprintContent {
 @JsonKey(name:"visit_id") String visitId;
 @JsonKey(name:"user_id") String userId;
 @JsonKey(name:"goods_id") String goodsId;
 @JsonKey(name:"goods_name") String goodsName;
 @JsonKey(name:"goods_price") String goodsPrice;
 @JsonKey(name:"goods_image") String goodsImage;
 @JsonKey(name:"create_time") String createTime;
 @JsonKey(name:"goods_type") String goodsType;

  FootprintContent();

  Map<String, dynamic> toJson() => _$FootprintContentToJson(this);

  factory FootprintContent.fromJson(Map<String, dynamic> json) =>
      _$FootprintContentFromJson(json);
}
