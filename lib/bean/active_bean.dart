import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'active_bean.g.dart';

@JsonSerializable()
class ActiveList extends Resp {
  List<ActiveItem> data;

  ActiveList();

  factory ActiveList.fromJson(Map<String, dynamic> json) =>
      _$ActiveListFromJson(json);
  Map<String,dynamic> toJson()=>_$ActiveListToJson(this);
}

@JsonSerializable()
class ActiveItem {
  @JsonKey(name: "activity_id")
  String activityId;
  @JsonKey(name: "activity_name")
  String activityName;
  @JsonKey(name: "activity_sign")
  String activitySign;
  String type;
  @JsonKey(name: "image_id")
  String imageId;
  String sort;
  @JsonKey(name: "is_delete")
  String isDelete;
  @JsonKey(name: "create_time")
  String createTime;
  @JsonKey(name: "update_time")
  String updateTime;
  HomeCategoryImage image;

  ActiveItem();

  factory ActiveItem.fromJson(Map<String, dynamic> json) =>
      _$ActiveItemFromJson(json);
  Map<String,dynamic> toJson()=>_$ActiveItemToJson(this);
}

@JsonSerializable()
class ActiveGoodsList extends Resp {
  ActiveGoodsList();

  factory ActiveGoodsList.fromJson(Map<String, dynamic> json) =>
      _$ActiveGoodsListFromJson(json);
  List<ActiveGoods> data;

  Map<String,dynamic> toJson()=>_$ActiveGoodsListToJson(this);
}

@JsonSerializable()
class ActiveGoods {
  factory ActiveGoods.fromJson(Map<String, dynamic> json) =>
      _$ActiveGoodsFromJson(json);

  Map<String,dynamic> toJson()=>_$ActiveGoodsToJson(this);
  ActiveGoods();

  String itemId;
  String itemTitle;
  String itemPicture;
  List<String> itemSmallPictures;
  String itemVolume;
  String itemUrl;
  String itemPrice;
  String couponPrice;
  String coupon;
  String itemFinalPrice;
  String commissionRate;
  String commissionAmount;
  String sellerName;
}
