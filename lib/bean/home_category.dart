import 'package:json_annotation/json_annotation.dart';

part 'home_category.g.dart';

class Resp {
  int code;
  String msg;
}

@JsonSerializable()
class EmptyDataResp extends Resp {
  EmptyDataResp();
  Map<String,dynamic> toJson()=>_$EmptyDataRespToJson(this);
  factory EmptyDataResp.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataRespFromJson(json);
}

@JsonSerializable()
class HomeCategory extends Resp {
  HomeCategory();

  List<HomeCategoryData> data;
  Map<String,dynamic> toJson()=>_$HomeCategoryToJson(this);
  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);
}

@JsonSerializable()
class HomeCategoryData {
  HomeCategoryData();

  @JsonKey(defaultValue: false,)
  bool isHome = false;
  @JsonKey( name: "category_id")
  String categoryId;
  String name;
  @JsonKey(name: "parent_id")
  String parentId;
  @JsonKey(name: "category_type")
  String categoryType;
  @JsonKey(name: "image_id")
  String imageId;
  String sort;
  @JsonKey(name: "create_time")
  String createTime;
  HomeCategoryImage image;
  List<HomeCategoryData> child;

  factory HomeCategoryData.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryDataToJson(this);
}

@JsonSerializable()
class HomeCategoryImage {
  HomeCategoryImage();

  @JsonKey(name: "file_path")
  String filePath;

  factory HomeCategoryImage.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryImageFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryImageToJson(this);
}

@JsonSerializable()
class HomeCategoryGoodsBean extends Resp {
  List<HomeCategoryGoods> data;

  HomeCategoryGoodsBean();
  Map<String,dynamic> toJson()=>_$HomeCategoryGoodsBeanToJson(this);
  factory HomeCategoryGoodsBean.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryGoodsBeanFromJson(json);
}

@JsonSerializable()
class HomeCategoryGoods {
  HomeCategoryGoods();

  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "goods_name")
  String goodsName;
  @JsonKey(name: "spec_type")
  String specType;
  @JsonKey(name: "shop_id")
  String shopId;
  @JsonKey(name: "is_shop")
  String isShop;
  @JsonKey(name: "category_id")
  String categoryId;
  @JsonKey(name: "goods_type")
  String goodsType;
  @JsonKey(name: "goods_sku_id")
  String goodsSkuId;
  @JsonKey(name: "goods_price")
  String goodsPrice;
  @JsonKey(name: "line_price")
  String linePrice;
  @JsonKey(name: "stock_num")
  String stockNum;
  @JsonKey(name: "goods_sales")
  String goodsSales;
  @JsonKey(name: "goods_image")
  String goodsImage;
  Map<String,dynamic> toJson()=>_$HomeCategoryGoodsToJson(this);
  factory HomeCategoryGoods.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryGoodsFromJson(json);
}

@JsonSerializable()
class BannerBean extends Resp {
  BannerBean();

  List<BannerData> data;
  Map<String,dynamic> toJson()=>_$BannerBeanToJson(this);
  factory BannerBean.fromJson(Map<String, dynamic> json) =>
      _$BannerBeanFromJson(json);
}

@JsonSerializable()
class BannerData {
  @JsonKey(name: "goods_id")
  String goodsId;
  @JsonKey(name: "img_url")
  String imgUrl;

  BannerData();


  Map<String,dynamic> toJson()=>_$BannerDataToJson(this);
  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);
}
