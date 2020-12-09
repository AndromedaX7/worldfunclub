import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/other.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderList extends Resp {
  OrderList();

  List<OrderData> data;

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}

@JsonSerializable()
class OrderData {
  String order_id;
  String order_no;
  String goods_num;
  String shop_name;
  String state_text;
  String order_status;
  String lh_order_status;
  String total_price;
  List<OrderGoods> goods;

  OrderData();
  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}

@JsonSerializable()
class OrderGoods {
  String order_goods_id;
  String goods_id;
  String goods_name;
  String goods_price;
  String total_num;
  String image;
  String goods_attr;

  OrderGoods();
  Map<String, dynamic> toJson() => _$OrderGoodsToJson(this);
  factory OrderGoods.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsFromJson(json);
}

@JsonSerializable()
class OrderDetailsResp extends Resp {
  OrderDetailsData data;

  OrderDetailsResp();
  Map<String, dynamic> toJson() => _$OrderDetailsRespToJson(this);
  factory OrderDetailsResp.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsRespFromJson(json);
}

@JsonSerializable()
class OrderDetailsData {
  OrderDetailsData();

  Map<String, dynamic> toJson() => _$OrderDetailsDataToJson(this);

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDataFromJson(json);
  String order_id;
  String order_no = "";
  String order_type;
  String create_time = "";
  String shop_name;
  String write_off;
  String qrcode;
  String order_status;
  String lh_order_status;
  String state_text;
  String name;
  String phone;
  String subscribe_date;
  String lh_start_time;
  String lh_end_time;
  String order_address_id;
  String address_name = "";
  String address_phone = "";
  String address_detail = "";
  String address_province = "";
  String address_city = "";
  String address_region = "";
  String shop_id;
  String shop_hours;
  String shop_address;
  String shop_longitude;
  String shop_latitude;
  String shop_logo;
  String shop_province;
  String shop_city;
  String shop_region;
  List<String> customer_service;
  String pay_type;
}

@JsonSerializable()
class RefundReasonResp extends Resp {
  RefundReasonData data;

  RefundReasonResp();

  factory RefundReasonResp.fromJson(Map<String, dynamic> json) =>
      _$RefundReasonRespFromJson(json);

  Map<String, dynamic> toJson() => _$RefundReasonRespToJson(this);
}

@JsonSerializable()
class RefundReasonData {
  List<String> refund_reason;

  RefundReasonData();
  Map<String, dynamic> toJson() => _$RefundReasonDataToJson(this);
  factory RefundReasonData.fromJson(Map<String, dynamic> json) =>
      _$RefundReasonDataFromJson(json);
}

@JsonSerializable()
class RefundListResp extends Resp {
  RefundListResp();

  List<RefundListData> data;
  Map<String, dynamic> toJson() => _$RefundListRespToJson(this);
  factory RefundListResp.fromJson(Map<String, dynamic> json) =>
      _$RefundListRespFromJson(json);
}

@JsonSerializable()
class RefundListData {
  RefundListData();

  @JsonKey(name: "order_refund_id")
  String orderRefundId;
  @JsonKey(name: "order_goods_id")
  String orderGoodsId;
  @JsonKey(name: "refund_money")
  String refundMoney;
  @JsonKey(name: "refund_status")
  String refundStatus;
  @JsonKey(name: "refund_text")
  String refundText;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "goods_attr")
  String goodsAttr;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "total_num")
  String totalNum;
  @JsonKey(name: "goods_image")
  String goodsImage;
  Map<String, dynamic> toJson() => _$RefundListDataToJson(this);
  factory RefundListData.fromJson(Map<String, dynamic> json) =>
      _$RefundListDataFromJson(json);
}

@JsonSerializable()
class OrderCommitResp extends Resp {
  OrderCommitData data;

  OrderCommitResp();
  Map<String, dynamic> toJson() => _$OrderCommitRespToJson(this);
  factory OrderCommitResp.fromJson(Map<String, dynamic> json) =>
      _$OrderCommitRespFromJson(json);
}

@JsonSerializable()
class OrderCommitData {
  @JsonKey(name:"order_id")
  String orderId;

  OrderCommitData();

  factory OrderCommitData.fromJson(Map<String, dynamic> json) =>
      _$OrderCommitDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCommitDataToJson(this);
}

@JsonSerializable()
class RefundDetailsResp extends Resp {
  RefundDetailsData data;

  RefundDetailsResp();

  factory RefundDetailsResp.fromJson(Map<String, dynamic> json) =>
      _$RefundDetailsRespFromJson(json);

  Map<String, dynamic> toJson() => _$RefundDetailsRespToJson(this);
}

@JsonSerializable()
class RefundDetailsData {
  RefundDetailsData();

  factory RefundDetailsData.fromJson(Map<String, dynamic> json) =>
      _$RefundDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefundDetailsDataToJson(this);
  @JsonKey(name: "refund_speed", defaultValue: "")
  String refundSpeed;
  @JsonKey(name: "speed_text", defaultValue: "")
  String speedText;
  @JsonKey(name: "express_id", defaultValue: "")
  String expressId;
  @JsonKey(name: "express_name", defaultValue: "")
  String expressName;
  @JsonKey(name: "express_no", defaultValue: "")
  String expressNo;
  @JsonKey(name: "type", defaultValue: "")
  String type;
  @JsonKey(name: "user_mobile", defaultValue: "")
  String userMobile;
  @JsonKey(name: "refuse_desc", defaultValue: "")
  String refuseDesc;
  @JsonKey(name: "seller_address", defaultValue: "")
  String sellerAddress;
}

@JsonSerializable()
class RefundCompanyListResp extends Resp {
  List<RefundCompanyData> data;

  RefundCompanyListResp();

  factory RefundCompanyListResp.fromJson(Map<String, dynamic> json) =>
      _$RefundCompanyListRespFromJson(json);

  Map<String, dynamic> toJson() => _$RefundCompanyListRespToJson(this);
}

@JsonSerializable()
class RefundCompanyData {
  String caption;
  String id;

  RefundCompanyData();

  factory RefundCompanyData.fromJson(Map<String, dynamic> json) =>
      _$RefundCompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefundCompanyDataToJson(this);
}


@JsonSerializable()
class ExpressLineResp extends Resp {
  ExpressLineData data;
  ExpressLineResp();

  factory ExpressLineResp.fromJson(Map<String, dynamic> json) =>
      _$ExpressLineRespFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressLineRespToJson(this);
}
@JsonSerializable()
class ExpressLineData {
  @JsonKey(defaultValue: "", includeIfNull: true)
  String deliveryNo;
  @JsonKey(defaultValue: "",includeIfNull: true)
  String deliveryName;
  @JsonKey(defaultValue: [])
  List<ExpressDeliveryList> deliveryList;
  @JsonKey(name: "goods_image",defaultValue: "")
  String goodsImage;

  ExpressLineData();

  factory ExpressLineData.fromJson(Map<String, dynamic> json) =>
      _$ExpressLineDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressLineDataToJson(this);
}
@JsonSerializable()
class ExpressDeliveryList {
  ExpressDeliveryList();

  factory ExpressDeliveryList.fromJson(Map<String, dynamic> json) =>
      _$ExpressDeliveryListFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressDeliveryListToJson(this);
  String title;
  String context;
  String time;
  String operator;
}

String orderState(GoodsType type, String orderLiveStatus, String orderStatus) {
  if (type == GoodsType.self) {
    switch (orderStatus) {
      case "10":
        return "待付款";
      case "20":
        return "待发货";
      case "30":
        return "待收货";
      case "40":
        return "待评价";
      default:
        return "";
    }
  } else {
    switch (orderLiveStatus) {
      case "10":
        return "待付款";
      case "20":
        return "待使用";
      case "30":
        return "已使用";
      case "40":
        return "已过期";
      default:
        return "";
    }
  }
}
