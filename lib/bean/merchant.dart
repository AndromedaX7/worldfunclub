import 'package:worldfunclub/bean/home_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'merchant.g.dart';
@JsonSerializable()
class WriteOffResp extends Resp {
  List<WriteOffData> data;
  WriteOffResp();
  factory WriteOffResp.fromJson(Map<String,dynamic> json)=>_$WriteOffRespFromJson(json);
  Map<String,dynamic> toJson()=>_$WriteOffRespToJson(this);
}
@JsonSerializable()
class WriteOffData {
  WriteOffData();
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "order_no")
  String orderNo;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "shop_name")
  String shopName;
  @JsonKey(name: "state_text")
  String stateText;
  @JsonKey(name: "lh_order_status")
  String orderStatus;
  @JsonKey(name: "lh_start_time")
  String startTime;
  @JsonKey(name: "lh_end_time")
  String endTime;
  List<WriteOffGoods> goods;

  factory WriteOffData.fromJson(Map<String,dynamic> json)=>_$WriteOffDataFromJson(json);
  Map<String,dynamic> toJson()=>_$WriteOffDataToJson(this);
}
@JsonSerializable()
class WriteOffGoods {
  WriteOffGoods();
  @JsonKey(name: "order_goods_id")
  String orderGoodsId;
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "goods_price")
  String price;
  @JsonKey(name: "total_num")
  String totalNumber;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "goods_attr")
  String goodsAttr;

  factory WriteOffGoods.fromJson(Map<String,dynamic> json)=>_$WriteOffGoodsFromJson(json);
  Map<String,dynamic> toJson()=>_$WriteOffGoodsToJson(this);
}


@JsonSerializable()
class ShopBalanceResp extends Resp {
  ShopBalanceData data;

  ShopBalanceResp();

  factory ShopBalanceResp.fromJson(Map<String, dynamic> json) =>
      _$ShopBalanceRespFromJson(json);
  Map<String,dynamic> toJson()=>_$ShopBalanceRespToJson(this);
}

@JsonSerializable()
class ShopBalanceData {
  @JsonKey(name: "shop_balance")String shopBalance;

  ShopBalanceData();

  factory ShopBalanceData.fromJson(Map<String, dynamic> json) =>
      _$ShopBalanceDataFromJson(json);
  Map<String,dynamic> toJson()=>_$ShopBalanceDataToJson(this);
}

