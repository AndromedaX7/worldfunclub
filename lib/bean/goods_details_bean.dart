import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'goods_details_bean.g.dart';

@JsonSerializable()
class GoodsDetailsBean extends Resp {
  GoodsData data;

  GoodsDetailsBean();

  factory GoodsDetailsBean.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsDetailsBeanToJson(this);
}

@JsonSerializable()
class GoodsData {
  @JsonKey(defaultValue: "", name: "goods_id")
  String goodsId;
  @JsonKey(defaultValue: "", name: "goods_name")
  String goodsName;
  @JsonKey(defaultValue: "", name: "selling_point")
  String sellingPoint;
  @JsonKey(defaultValue: "", name: "category_id")
  String categoryId;
  @JsonKey(defaultValue: "", name: "goods_type")
  String goodsType;
  @JsonKey(defaultValue: "", name: "spec_type")
  String specType;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: "", name: "is_shop")
  String isShop;
  @JsonKey(defaultValue: "", name: "shop_id")
  String shopId;
  @JsonKey(defaultValue: "")
  String subscribe;
  @JsonKey(defaultValue: "", name: "lh_start_time")
  String startTime;
  @JsonKey(defaultValue: "", name: "lh_end_time")
  String endTime;
  @JsonKey(defaultValue: "", name: "goods_sales")
  String goodsSales;
  @JsonKey(defaultValue: "", name: "collected_status")
  String collectedStatus;
  @JsonKey(defaultValue: "", name: "comment_data_count")
  String commentDataCount;
  @JsonKey(defaultValue: "", name: "cart_total_num")
  String cartTotalNum;
  @JsonKey(name: "comment_data", defaultValue: [])
  List<CommentData> commentData;
  @JsonKey(defaultValue: [], name: "goods_images")
  List<String> goodsImages;
  @JsonKey(name: "spec_attr")
  List<SpecAttrBean> specAttr;
  @JsonKey(name: "sku_list")
  List<SkuListBean> skuList;

  GoodsData();

  factory GoodsData.fromJson(Map<String, dynamic> json) =>
      _$GoodsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsDataToJson(this);
}

@JsonSerializable()
class CommentData {
  @JsonKey(name: "comment_id")
  String commentId;
  String star;
  String content;
  @JsonKey(name: "create_time")
  String createTime;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(defaultValue: "")
  String nickName;
  @JsonKey(defaultValue: "")
  String avatarUrl;
  List<String> images;
  @JsonKey(name: "goods_attr")
  String goodsAttr;
  @JsonKey(name: "thumb_num")
  String thumbNum;
  @JsonKey(name: "is_thumb")
  String isThumb;


  CommentData();

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
}

@JsonSerializable()
class CommentDataList extends CommentData {
  @JsonKey(defaultValue: "", name: "nickname") String nickName;
  @JsonKey(defaultValue: "", name: "avatar") String avatarUrl;


  CommentDataList();

  Map<String, dynamic> toJson() => _$CommentDataListToJson(this);

  factory CommentDataList.fromJson(Map<String, dynamic> json) =>
      _$CommentDataListFromJson(json);
}

@JsonSerializable()
class CommentPageData {
  List<CommentDataList> list;
  @JsonKey(defaultValue:"0",name: "all_num") String all;
  @JsonKey(defaultValue:"0",name: "praise_num") String praise;
  @JsonKey(defaultValue:"0",name: "review_num") String review;
  @JsonKey(defaultValue:"0",name: "negative_num") String negative;
  @JsonKey(defaultValue:"0",name: "picture_num") String picture;


  CommentPageData();

  Map<String, dynamic> toJson() => _$CommentPageDataToJson(this);

  factory CommentPageData.fromJson(Map<String, dynamic> json) =>
      _$CommentPageDataFromJson(json);
}
@JsonSerializable()
class CommentResp extends Resp{
  CommentPageData data;

  CommentResp();

  Map<String, dynamic> toJson() => _$CommentRespToJson(this);

  factory CommentResp.fromJson(Map<String, dynamic> json) =>
      _$CommentRespFromJson(json);
}

@JsonSerializable()
class SpecAttrBean {
  @JsonKey(name: "group_id")
  String groupId;
  @JsonKey(name: "group_name")
  String groupName;

  @JsonKey(defaultValue: 0)
  int selected = 0;
  @JsonKey(name: "spec_items")
  List<SpecItemsBean> specItems;

  SpecAttrBean();

  factory SpecAttrBean.fromJson(Map<String, dynamic> json) =>
      _$SpecAttrBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SpecAttrBeanToJson(this);
}

@JsonSerializable()
class SkuListBean {
  @JsonKey(name: "goods_sku_id")
  String goodsSkuId;
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "spec_sku_id")
  String specSkuId;
  @JsonKey(name: "image_id")
  String imageId;
  @JsonKey(name: "goods_no")
  String goodsNo;
  @JsonKey(name: "goods_price")
  String goodsPrice;
  @JsonKey(name: "line_price")
  String linePrice;
  @JsonKey(name: "stock_num")
  String stockNum;
  @JsonKey(name: "goods_sales")
  String goodsSales;
  @JsonKey(name: "goods_weight")
  String goodsWeight;
  String image;

  SkuListBean();

  factory SkuListBean.fromJson(Map<String, dynamic> json) =>
      _$SkuListBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SkuListBeanToJson(this);
}

class LiveGoodsItemMapping {
  SkuListBean sku;
  String itemId = "";
  String specValue = "";

  var groupId = "";
  var groupName = "";

  var needSubScribe = false;
  var needSubScribeDate = "";

  LiveGoodsItemMapping.most(this.sku, LiveGoodsDetailsData data,
      SpecAttrBean attr, SpecItemsBean item) {
    needSubScribe = data.subscribe == "20";
    itemId = item.itemId;
    specValue = item.specValue;
    groupId = attr.groupId;
    groupName = attr.groupName;
    needSubScribeDate = needSubScribe
        ? "${data.shopInfo.shopHours ?? "8:00-22:00"} | 需要预约"
        : "周一至周日  |  免预约";
  }

  LiveGoodsItemMapping.single(this.sku, LiveGoodsDetailsData data) {
    itemId = sku.goodsId;
    specValue = data.goodsName;
    groupId = data.goodsId;
    groupName = data.sellingPoint;
    needSubScribe = data.subscribe == "20";
    needSubScribeDate = needSubScribe
        ? "${data.shopInfo.shopHours ?? "8:00-22:00"} | 需要预约"
        : "周一至周日  |  免预约";
  }
}

@JsonSerializable()
class SpecItemsBean {
  @JsonKey(name: "item_id")
  String itemId;
  @JsonKey(name: "spec_value")
  String specValue;

  SpecItemsBean();

  factory SpecItemsBean.fromJson(Map<String, dynamic> json) =>
      _$SpecItemsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SpecItemsBeanToJson(this);
}

@JsonSerializable()
class LiveGoodsDetailsResp extends Resp {
  LiveGoodsDetailsData data;

  LiveGoodsDetailsResp();

  factory LiveGoodsDetailsResp.fromJson(Map<String, dynamic> json) =>
      _$LiveGoodsDetailsRespFromJson(json);

  Map<String, dynamic> toJson() => _$LiveGoodsDetailsRespToJson(this);
}

@JsonSerializable()
class LiveGoodsDetailsData extends GoodsData {
  LiveShopInfo shopInfo;

  LiveGoodsDetailsData();

  factory LiveGoodsDetailsData.fromJson(Map<String, dynamic> json) =>
      _$LiveGoodsDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LiveGoodsDetailsDataToJson(this);
}

@JsonSerializable()
class LiveShopInfo {
  @JsonKey(defaultValue: "", name: "shop_id")
  String shopId;
  @JsonKey(defaultValue: "", name: "shop_name")
  String shopName;
  @JsonKey(defaultValue: "")
  String phone;
  @JsonKey(defaultValue: "", name: "shop_hours")
  String shopHours;
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

  Map<String, dynamic> toJson() => _$LiveShopInfoToJson(this);

}
