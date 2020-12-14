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
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "order_no")
  String orderNo;
  @JsonKey(name: "goods_num")
  String goodsNum;
  @JsonKey(name: "shop_name")
  String shopName;
  @JsonKey(name: "state_text")
  String stateText;
  @JsonKey(name: "order_status")
  String orderStatus;
  @JsonKey(name: "lh_order_status")
  String lhOrderStatus;
  @JsonKey(name: "total_price")
  String totalPrice;
  List<OrderGoods> goods;

  OrderData();

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}

@JsonSerializable()
class OrderGoods {
  @JsonKey(name: "order_goods_id")
  String orderGoodsId;
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "goods_price")
  String goodsPrice;
  @JsonKey(name: "total_num")
  String totalNum;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "goods_attr")
  String goodsAttr;

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
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "order_no", defaultValue: "")
  String orderNo = "";
  @JsonKey(name: "order_type")
  String orderType;
  @JsonKey(name: "create_time")
  String createTime = "";
  @JsonKey(name: "shop_name")
  String shopName;
  @JsonKey(name: "write_off")
  String writeOff;
  @JsonKey(name: "qrcode")
  String qrCode;
  @JsonKey(name: "order_status")String orderStatus;
  @JsonKey(name: "lh_order_status")String lhOrderStatus;
  @JsonKey(name: "state_text")String stateText;
  String name;
  String phone;
 @JsonKey(name: "subscribe_date") String subscribeDate;
 @JsonKey(name: "lh_start_time") String startTime;
 @JsonKey(name: "lh_end_time") String endTime;
 @JsonKey(name: "order_address_id") String orderAddressId;
 @JsonKey(name: "address_name") String addressName = "";
 @JsonKey(name: "address_phone") String addressPhone = "";
 @JsonKey(name: "address_detail") String addressDetail = "";
 @JsonKey(name: "address_province") String addressProvince = "";
 @JsonKey(name: "address_city") String addressCity = "";
 @JsonKey(name: "address_region") String addressRegion = "";
 @JsonKey(name: "shop_id") String shopId;
 @JsonKey(name: "shop_hours") String shopHours;
 @JsonKey(name: "shop_address") String shopAddress;
 @JsonKey(name: "shop_longitude") String shopLongitude;
 @JsonKey(name: "shop_latitude") String shopLatitude;
 @JsonKey(name: "shop_logo") String shopLogo;
 @JsonKey(name: "shop_province") String shopProvince;
 @JsonKey(name: "shop_city") String shopCity;
 @JsonKey(name: "shop_region") String shopRegion;
 @JsonKey(name: "customer_service") List<String> customerService;
 @JsonKey(name: "pay_type") String payType;
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
  @JsonKey(name: "refund_reason")
  List<String> refundReason;

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
  @JsonKey(name: "order_id")
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
  @JsonKey(defaultValue: "", includeIfNull: true)
  String deliveryName;
  @JsonKey(defaultValue: [])
  List<ExpressDeliveryList> deliveryList;
  @JsonKey(name: "goods_image", defaultValue: "")
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
