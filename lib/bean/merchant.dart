import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'merchant.g.dart';

@JsonSerializable()
class WriteOffResp extends Resp {
  List<WriteOffData> data;

  WriteOffResp();

  factory WriteOffResp.fromJson(Map<String, dynamic> json) =>
      _$WriteOffRespFromJson(json);

  Map<String, dynamic> toJson() => _$WriteOffRespToJson(this);
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

  factory WriteOffData.fromJson(Map<String, dynamic> json) =>
      _$WriteOffDataFromJson(json);

  Map<String, dynamic> toJson() => _$WriteOffDataToJson(this);
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

  factory WriteOffGoods.fromJson(Map<String, dynamic> json) =>
      _$WriteOffGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$WriteOffGoodsToJson(this);
}

@JsonSerializable()
class ShopBalanceResp extends Resp {
  ShopBalanceData data;

  ShopBalanceResp();

  factory ShopBalanceResp.fromJson(Map<String, dynamic> json) =>
      _$ShopBalanceRespFromJson(json);

  Map<String, dynamic> toJson() => _$ShopBalanceRespToJson(this);
}

@JsonSerializable()
class ShopBalanceData {
  @JsonKey(name: "shop_balance")
  String shopBalance;

  ShopBalanceData();

  factory ShopBalanceData.fromJson(Map<String, dynamic> json) =>
      _$ShopBalanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShopBalanceDataToJson(this);
}

@JsonSerializable()
class BankListResp extends Resp {
  List<BankListData> data;

  BankListResp();

  factory BankListResp.fromJson(Map<String, dynamic> json) =>
      _$BankListRespFromJson(json);

  Map<String, dynamic> toJson() => _$BankListRespToJson(this);
}

@JsonSerializable()
class BankListData {
  BankListData();

  factory BankListData.fromJson(Map<String, dynamic> json) =>
      _$BankListDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankListDataToJson(this);
  @JsonKey(name: "bankcard_id")
  String bankcardId;
  @JsonKey(name: "bank_name")
  String bankName;
  @JsonKey(name: "bank_card")
  String bankCard;
  @JsonKey(name: "bank_account")
  String bankAccount;
}

@JsonSerializable()
class WithdrawRecordListResp extends Resp {
  List<WithdrawRecordListData> data;

  WithdrawRecordListResp();

  factory WithdrawRecordListResp.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRecordListRespFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRecordListRespToJson(this);
}

@JsonSerializable()
class WithdrawRecordListData {
  WithdrawRecordListData();

  factory WithdrawRecordListData.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRecordListDataFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRecordListDataToJson(this);

  String desc;
  @JsonKey(name: "set_time")
  String setTime;
  String money;
  String type;
}

@JsonSerializable()
class ScanInfoResp extends Resp {
  ScanInfoData data;

  ScanInfoResp();

  factory ScanInfoResp.fromJson(Map<String, dynamic> json) =>
      _$ScanInfoRespFromJson(json);

  Map<String, dynamic> toJson() => _$ScanInfoRespToJson(this);

}

@JsonSerializable()
class ScanInfoData {


  ScanInfoData();

  factory ScanInfoData.fromJson(Map<String, dynamic> json) =>
      _$ScanInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$ScanInfoDataToJson(this);

  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "write_off")
  String writeOff;
  @JsonKey(name: "order_no")
  String orderNo;
  @JsonKey(name: "total_num")
  String totalNum;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "writeOff_num")
  String writeOffNum;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "lh_start_time")
  String startTime;
  @JsonKey(name: "lh_end_time")
  String endTime;
}
