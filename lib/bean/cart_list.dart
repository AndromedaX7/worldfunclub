import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
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
 @JsonKey(name: "order_total_num") String orderTotalNum;
 @JsonKey(name: "pay_type") String payType;
 @JsonKey(name: "order_total_price") String orderTotalPrice;
 @JsonKey(name: "coupon_id") String couponId;
 @JsonKey(name: "coupon_money") String couponMoney;
 @JsonKey(name: "order_price") String orderPrice;
 @JsonKey(name: "order_pay_price") String orderPayPrice;
 @JsonKey(name: "goods_list") List<GoodsListBean> goodsList;

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

  factory GoodsListBean.fromGoodsDetails(GoodsData goodsData, String images,
      String price, String skuId, String attr, int count) {
    return GoodsListBean()
      ..goods_image = images
      ..goods_id = goodsData.goods_id
      ..goods_sku_id = skuId
      ..goods_price = price
      ..total_num = "$count"
      ..goods_name=goodsData.goods_name
      ..goods_attr = attr;

  }

}
