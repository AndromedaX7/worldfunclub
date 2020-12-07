import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'goods_details_bean.g.dart';

@JsonSerializable()
class GoodsDetailsBean extends Resp {
  GoodsData data;

  GoodsDetailsBean();

  factory GoodsDetailsBean.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailsBeanFromJson(json);
  Map<String,dynamic> toJson()=>_$GoodsDetailsBeanToJson(this);
}

@JsonSerializable()
class GoodsData {
  @JsonKey(defaultValue: "",name:"goods_id" )
  String goodsId;
  @JsonKey(defaultValue: "",name: "goods_name")
  String goodsName;
  @JsonKey(defaultValue: "",name: "selling_point")
  String sellingPoint;
  @JsonKey(defaultValue: "",name: "category_id")
  String categoryId;
  @JsonKey(defaultValue: "",name: "goods_type")
  String goodsType;
  @JsonKey(defaultValue: "",name: "spec_type")
  String specType;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: "",name: "is_shop")
  String isShop;
  @JsonKey(defaultValue: "")
  String shop_id;
  @JsonKey(defaultValue: "")
  String subscribe;
  @JsonKey(defaultValue: "")
  String lh_start_time;
  @JsonKey(defaultValue: "")
  String lh_end_time;
  @JsonKey(defaultValue: "")
  String goods_sales;
  @JsonKey(defaultValue: "")
  String collected_status;
  @JsonKey(defaultValue: "")
  String comment_data_count;
  @JsonKey(defaultValue: "")
  String cart_total_num;
  List<CommentData> comment_data;
  @JsonKey(defaultValue: [])
  List<String> goods_images;
  List<SpecAttrBean> spec_attr;
  List<SkuListBean> sku_list;

  GoodsData();

  factory GoodsData.fromJson(Map<String, dynamic> json) =>
      _$GoodsDataFromJson(json);

  Map<String,dynamic> toJson()=>_$GoodsDataToJson(this);
}

@JsonSerializable()
class CommentData {
  String comment_id;
  String star;
  String content;
  String create_time;
  String user_id;
  String nickName;
  String avatarUrl;
  List<String> images;
  String goods_attr;
  String thumb_num;
  String is_thumb;

  CommentData();
  Map<String,dynamic> toJson()=>_$CommentDataToJson(this);
  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
}

@JsonSerializable()
class SpecAttrBean {
  String group_id;
  String group_name;

  @JsonKey(defaultValue: 0)
  int selected = 0;
  List<SpecItemsBean> spec_items;

  SpecAttrBean();

  factory SpecAttrBean.fromJson(Map<String, dynamic> json) =>
      _$SpecAttrBeanFromJson(json);

  Map<String,dynamic> toJson()=>_$SpecAttrBeanToJson(this);
}

@JsonSerializable()
class SkuListBean {
  String goods_sku_id;
  String goods_id;
  String spec_sku_id;
  String image_id;
  String goods_no;
  String goods_price;
  String line_price;
  String stock_num;
  String goods_sales;
  String goods_weight;
  String image;

  SkuListBean();

  factory SkuListBean.fromJson(Map<String, dynamic> json) =>
      _$SkuListBeanFromJson(json);
  Map<String,dynamic> toJson()=>_$SkuListBeanToJson(this);
}

class LiveGoodsItemMapping {
  SkuListBean sku;
  String item_id = "";
  String spec_value = "";

  var group_id = "";
  var group_name = "";

  var needSubScribe = false;
  var needSubScribeDate = "";

  LiveGoodsItemMapping.most(this.sku, LiveGoodsDetailsData data,
      SpecAttrBean attr, SpecItemsBean item) {
    needSubScribe = data.subscribe == "20";
    item_id = item.item_id;
    spec_value = item.spec_value;
    group_id = attr.group_id;
    group_name = attr.group_name;
    needSubScribeDate = needSubScribe
        ? "${data.shopInfo.shop_hours ?? "8:00-22:00"} | 需要预约"
        : "周一至周日  |  免预约";
  }

  LiveGoodsItemMapping.single(this.sku, LiveGoodsDetailsData data) {
    item_id = sku.goods_id;
    spec_value = data.goodsName;
    group_id = data.goodsId;
    group_name = data.sellingPoint;
    needSubScribe = data.subscribe == "20";
    needSubScribeDate = needSubScribe
        ? "${data.shopInfo.shop_hours ?? "8:00-22:00"} | 需要预约"
        : "周一至周日  |  免预约";
  }
}

@JsonSerializable()
class SpecItemsBean {
  String item_id;
  String spec_value;

  SpecItemsBean();

  factory SpecItemsBean.fromJson(Map<String, dynamic> json) =>
      _$SpecItemsBeanFromJson(json);
  Map<String,dynamic> toJson()=>_$SpecItemsBeanToJson(this);
}

@JsonSerializable()
class LiveGoodsDetailsResp extends Resp {
  LiveGoodsDetailsData data;

  LiveGoodsDetailsResp();

  factory LiveGoodsDetailsResp.fromJson(Map<String, dynamic> json) =>
      _$LiveGoodsDetailsRespFromJson(json);
  Map<String,dynamic> toJson()=>_$LiveGoodsDetailsRespToJson(this);
}

@JsonSerializable()
class LiveGoodsDetailsData extends GoodsData {
  LiveShopInfo shopInfo;

  LiveGoodsDetailsData();

  factory LiveGoodsDetailsData.fromJson(Map<String, dynamic> json) =>
      _$LiveGoodsDetailsDataFromJson(json);

  Map<String,dynamic> toJson()=>_$LiveGoodsDetailsDataToJson(this);
}

@JsonSerializable()
class LiveShopInfo {
  @JsonKey(defaultValue: "")
  String shop_id;
  @JsonKey(defaultValue: "")
  String shop_name;
  @JsonKey(defaultValue: "")
  String phone;
  @JsonKey(defaultValue: "")
  String shop_hours;
  @JsonKey(defaultValue: "")
  String address;
  @JsonKey(defaultValue: "")
  String longitude;
  @JsonKey(defaultValue: "")
  String latitude;
  @JsonKey(defaultValue: "")
  String logo;
  @JsonKey(defaultValue: "")
  String province;
  @JsonKey(defaultValue: "")
  String city;
  @JsonKey(defaultValue: "")
  String region;

  LiveShopInfo();

  factory LiveShopInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveShopInfoFromJson(json);
  Map<String,dynamic> toJson()=>_$LiveShopInfoToJson(this);

}
