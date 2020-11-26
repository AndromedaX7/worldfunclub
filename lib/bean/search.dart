import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'search.g.dart';
@JsonSerializable()
class GoodsSearchList extends Resp {
  GoodsSearchList();
  List<GoodsSearchData> data;

  factory GoodsSearchList.fromJson(Map<String,dynamic>json)=>_$GoodsSearchListFromJson(json);
}
@JsonSerializable()
class GoodsSearchData {
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

  GoodsSearchData();
  factory GoodsSearchData.fromJson(Map<String,dynamic> json) =>_$GoodsSearchDataFromJson(json);
}
