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

  Map<String,dynamic> toJson()=>_$CartBeanToJson(this);
}

@JsonSerializable()
class CartData {
  @JsonKey(name: "order_total_num")
  String orderTotalNum;
  @JsonKey(name: "pay_type")
  String payType;
  @JsonKey(name: "order_total_price")
  String orderTotalPrice;
  @JsonKey(name: "coupon_id")
  String couponId;
  @JsonKey(name: "coupon_money")
  String couponMoney;
  @JsonKey(name: "order_price")
  String orderPrice;
  @JsonKey(name: "order_pay_price")
  String orderPayPrice;
  @JsonKey(name: "goods_list")
  List<GoodsListBean> goodsList;

  CartData();

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
  Map<String,dynamic> toJson()=>_$CartDataToJson(this);
// List<?> coupon_list;
}

@JsonSerializable()
class GoodsListBean {
  @JsonKey(defaultValue: true)
  bool enabled;
  @JsonKey(defaultValue: false)
  bool selected;
  @JsonKey(name: "start_time")
  String startTime = "1";

  @JsonKey(name: "end_time")
  String endTime;
  @JsonKey(name: "cart_id")
  String cartId;
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "goods_sku_id")
  String goodsSkuId;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "goods_image")
  String goodsImage;
  @JsonKey(name: "goods_type")
  String goodsType;
  @JsonKey(name: "spec_type")
  String specType;
  @JsonKey(name: "goods_attr")
  String goodsAttr;
  @JsonKey(name: "goods_price")
  String goodsPrice;
  @JsonKey(name: "line_price")
  String linePrice;
  @JsonKey(name: "stock_num")
  String stockNum;
  @JsonKey(name: "shop_id")
  String shopId;
  @JsonKey(name: "shop_name")
  String shopName;
  @JsonKey(name: "total_num")
  String totalNum;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "is_user_grade")
  String isUserGrade;
  @JsonKey(name: "grade_ratio")
  String gradeRatio;
  @JsonKey(name: "grade_goods_price")
  String gradeGoodsPrice;
  @JsonKey(name: "grade_total_money")
  String gradeTotalMoney;
  @JsonKey(name: "coupon_money")
  String couponMoney;
  @JsonKey(name: "total_pay_price")
  String totalPayPrice;
  @JsonKey(name: "points_bonus")
  String pointsBonus;

  bool isEnabled() {
    return isEmpty(this.startTime) ||
        this.startTime.integer * 1000 < DateTime.now().millisecondsSinceEpoch;
  }

  GoodsListBean();

  Map<String,dynamic> toJson()=>_$GoodsListBeanToJson(this);

  factory GoodsListBean.fromJson(Map<String, dynamic> json) =>
      _$GoodsListBeanFromJson(json);

  factory GoodsListBean.fromGoodsDetails(GoodsData goodsData, String images,
      String price, String skuId, String attr, int count) {
    return GoodsListBean()
      ..goodsImage = images
      ..goodsId = goodsData.goodsId
      ..goodsSkuId = skuId
      ..goodsPrice = price
      ..totalNum = "$count"
      ..goodsName = goodsData.goodsName
      ..goodsAttr = attr;
  }
}
