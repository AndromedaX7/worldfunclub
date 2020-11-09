import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'goods_details_bean.g.dart';

@JsonSerializable()
class GoodsDetailsBean extends Resp{
  GoodsData data;

  GoodsDetailsBean();
  factory GoodsDetailsBean.fromJson(Map<String ,dynamic>json)=>_$GoodsDetailsBeanFromJson(json);
}
@JsonSerializable()
class GoodsData{
  String goods_id;
  String goods_name;
  String selling_point;
  String category_id;
  String goods_type;
  String spec_type;
  String content;
  String is_shop;
  String shop_id;
  String subscribe;
  String lh_start_time;
  String lh_end_time;
  String goods_sales;
  String collected_status;
  String comment_data_count;
  String cart_total_num;
  List<CommentData> comment_data;
  List<String> goods_images;
  List<SpecAttrBean> spec_attr;
  List<SkuListBean> sku_list;

  GoodsData();
  factory GoodsData.fromJson(Map<String ,dynamic>json)=>_$GoodsDataFromJson(json);
}
@JsonSerializable()
class CommentData{
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
  factory CommentData.fromJson(Map<String ,dynamic>json)=>_$CommentDataFromJson(json);

}
@JsonSerializable()
class SpecAttrBean{
  String group_id;
  String group_name;
  List<SpecItemsBean> spec_items;

  SpecAttrBean();
  factory SpecAttrBean.fromJson(Map<String ,dynamic>json)=>_$SpecAttrBeanFromJson(json);
}
@JsonSerializable()
class SkuListBean{
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
  factory SkuListBean.fromJson(Map<String ,dynamic>json)=>_$SkuListBeanFromJson(json);
}
@JsonSerializable()
class SpecItemsBean{
  String item_id;
  String spec_value;
  SpecItemsBean();
  factory SpecItemsBean.fromJson(Map<String ,dynamic>json)=>_$SpecItemsBeanFromJson(json);
}