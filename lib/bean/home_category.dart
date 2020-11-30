import 'package:json_annotation/json_annotation.dart';

part 'home_category.g.dart';

class Resp {
  int code;
  String msg;
}

@JsonSerializable()
class EmptyDataResp extends Resp {
  EmptyDataResp();

  factory EmptyDataResp.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataRespFromJson(json);
}

@JsonSerializable()
class HomeCategory extends Resp {
  HomeCategory();

  List<HomeCategoryData> data;

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);
}

@JsonSerializable()
class HomeCategoryData {
  HomeCategoryData();
  @JsonKey(defaultValue: false) bool isHome=false;
  String category_id;
  String name;
  String parent_id;
  String category_type;
  String image_id;
  String sort;
  String create_time;
  HomeCategoryImage image;
  List<HomeCategoryData> child;

  factory HomeCategoryData.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryDataFromJson(json);

  Map<String,dynamic> toJson()=>_$HomeCategoryDataToJson(this);
}

@JsonSerializable()
class HomeCategoryImage {
  HomeCategoryImage();

  String file_path;

  factory HomeCategoryImage.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryImageFromJson(json);

  Map<String ,dynamic> toJson()=>_$HomeCategoryImageToJson(this);
}

@JsonSerializable()
class HomeCategoryGoodsBean extends Resp {
  List<HomeCategoryGoods> data;

  HomeCategoryGoodsBean();

  factory HomeCategoryGoodsBean.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryGoodsBeanFromJson(json);
}

@JsonSerializable()
class HomeCategoryGoods {
  HomeCategoryGoods();

  String goods_id;
  String goods_name;
  String spec_type;
  String shop_id;
  String is_shop;
  String category_id;
  String goods_type;
  String goods_sku_id;
  String goods_price;
  String line_price;
  String stock_num;
  String goods_sales;
  String goods_image;

  factory HomeCategoryGoods.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryGoodsFromJson(json);
}

@JsonSerializable()
class BannerBean extends Resp {
  BannerBean();

  List<BannerData> data;

  factory BannerBean.fromJson(Map<String, dynamic> json) =>
      _$BannerBeanFromJson(json);
}

@JsonSerializable()
class BannerData {
  String goods_id;
  String img_url;

  BannerData();

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);
}
