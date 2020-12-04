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

  factory OrderGoods.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsFromJson(json);
}

@JsonSerializable()
class OrderDetailsResp extends Resp {
  OrderDetailsData data;
  OrderDetailsResp();
  factory OrderDetailsResp.fromJson(Map<String , dynamic> json)=>_$OrderDetailsRespFromJson(json);
}
@JsonSerializable()
class OrderDetailsData {

  OrderDetailsData();
  factory OrderDetailsData.fromJson(Map<String , dynamic> json)=>_$OrderDetailsDataFromJson(json);
  String order_id;
  String order_no="";
  String order_type;
  String create_time="";
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
  String address_name="";
  String address_phone="";
  String address_detail="";
  String address_province="";
  String address_city="";
  String address_region="";
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
