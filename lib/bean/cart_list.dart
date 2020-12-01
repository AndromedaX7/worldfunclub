import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/extensions/string_extension.dart';

part 'cart_list.g.dart';

@JsonSerializable()
class CartBean extends Resp {
  CartBean();

  factory CartBean.fromJson(Map<String, dynamic> json) =>
      _$CartBeanFromJson(json);
  CartData data;
}

@JsonSerializable()
class CartData {
  String order_total_num;
  String pay_type;
  String order_total_price;
  String coupon_id;
  String coupon_money;
  String order_price;
  String order_pay_price;
  List<GoodsListBean> goods_list;

  CartData();

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
// List<?> coupon_list;
}

@JsonSerializable()
class GoodsListBean {
  @JsonKey(defaultValue: true)
  bool enabled;
  @JsonKey(defaultValue: false)
  bool selected;
  String start_time = "1";
  String end_time;
  String cart_id;
  String goods_id;
  String goods_sku_id;
  String goods_name;
  String goods_image;
  String goods_type;
  String spec_type;
  String goods_attr;
  String goods_price;
  String line_price;
  String stock_num;
  String shop_id;
  String shop_name;
  String total_num;
  String total_price;
  String is_user_grade;
  String grade_ratio;
  String grade_goods_price;
  String grade_total_money;
  String coupon_money;
  String total_pay_price;
  String points_bonus;

  bool isEnabled() {
    return isEmpty(this.start_time) ||
        this.start_time.integer * 1000 < DateTime.now().millisecondsSinceEpoch;
  }

  GoodsListBean();

  factory GoodsListBean.fromJson(Map<String, dynamic> json) =>
      _$GoodsListBeanFromJson(json);
}
