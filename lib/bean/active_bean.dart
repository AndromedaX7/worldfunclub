import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'active_bean.g.dart';

@JsonSerializable()
class ActiveList extends Resp {
  List<ActiveItem> data;

  ActiveList();

  factory ActiveList.fromJson(Map<String, dynamic> json) =>
      _$ActiveListFromJson(json);
}

@JsonSerializable()
class ActiveItem {
  String activity_id;
  String activity_name;
  String activity_sign;
  String type;
  String image_id;
  String sort;
  String is_delete;
  String create_time;
  String update_time;
  HomeCategoryImage image;

  ActiveItem();

  factory ActiveItem.fromJson(Map<String, dynamic> json) =>
      _$ActiveItemFromJson(json);
}
@JsonSerializable()
class ActiveGoodsList extends Resp {
  ActiveGoodsList();
  factory ActiveGoodsList.fromJson(Map<String,dynamic>json)=>_$ActiveGoodsListFromJson(json);
  List<ActiveGoods> data;
}
@JsonSerializable()
class ActiveGoods {

  factory ActiveGoods.fromJson(Map<String,dynamic>json)=>_$ActiveGoodsFromJson(json);
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
