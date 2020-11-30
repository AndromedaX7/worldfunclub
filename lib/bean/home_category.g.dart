// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyDataResp _$EmptyDataRespFromJson(Map<String, dynamic> json) {
  return EmptyDataResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$EmptyDataRespToJson(EmptyDataResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
    };

HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) {
  return HomeCategory()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HomeCategoryData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeCategoryToJson(HomeCategory instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

HomeCategoryData _$HomeCategoryDataFromJson(Map<String, dynamic> json) {
  return HomeCategoryData()
    ..isHome = json['isHome'] as bool ?? false
    ..category_id = json['category_id'] as String
    ..name = json['name'] as String
    ..parent_id = json['parent_id'] as String
    ..category_type = json['category_type'] as String
    ..image_id = json['image_id'] as String
    ..sort = json['sort'] as String
    ..create_time = json['create_time'] as String
    ..image = json['image'] == null
        ? null
        : HomeCategoryImage.fromJson(json['image'] as Map<String, dynamic>)
    ..child = (json['child'] as List)
        ?.map((e) => e == null
            ? null
            : HomeCategoryData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeCategoryDataToJson(HomeCategoryData instance) =>
    <String, dynamic>{
      'isHome': instance.isHome,
      'category_id': instance.category_id,
      'name': instance.name,
      'parent_id': instance.parent_id,
      'category_type': instance.category_type,
      'image_id': instance.image_id,
      'sort': instance.sort,
      'create_time': instance.create_time,
      'image': instance.image,
      'child': instance.child,
    };

HomeCategoryImage _$HomeCategoryImageFromJson(Map<String, dynamic> json) {
  return HomeCategoryImage()..file_path = json['file_path'] as String;
}

Map<String, dynamic> _$HomeCategoryImageToJson(HomeCategoryImage instance) =>
    <String, dynamic>{
      'file_path': instance.file_path,
    };

HomeCategoryGoodsBean _$HomeCategoryGoodsBeanFromJson(
    Map<String, dynamic> json) {
  return HomeCategoryGoodsBean()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HomeCategoryGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeCategoryGoodsBeanToJson(
        HomeCategoryGoodsBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

HomeCategoryGoods _$HomeCategoryGoodsFromJson(Map<String, dynamic> json) {
  return HomeCategoryGoods()
    ..goods_id = json['goods_id'] as String
    ..goods_name = json['goods_name'] as String
    ..spec_type = json['spec_type'] as String
    ..shop_id = json['shop_id'] as String
    ..is_shop = json['is_shop'] as String
    ..category_id = json['category_id'] as String
    ..goods_type = json['goods_type'] as String
    ..goods_sku_id = json['goods_sku_id'] as String
    ..goods_price = json['goods_price'] as String
    ..line_price = json['line_price'] as String
    ..stock_num = json['stock_num'] as String
    ..goods_sales = json['goods_sales'] as String
    ..goods_image = json['goods_image'] as String;
}

Map<String, dynamic> _$HomeCategoryGoodsToJson(HomeCategoryGoods instance) =>
    <String, dynamic>{
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'spec_type': instance.spec_type,
      'shop_id': instance.shop_id,
      'is_shop': instance.is_shop,
      'category_id': instance.category_id,
      'goods_type': instance.goods_type,
      'goods_sku_id': instance.goods_sku_id,
      'goods_price': instance.goods_price,
      'line_price': instance.line_price,
      'stock_num': instance.stock_num,
      'goods_sales': instance.goods_sales,
      'goods_image': instance.goods_image,
    };

BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) {
  return BannerBean()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : BannerData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData()
    ..goods_id = json['goods_id'] as String
    ..img_url = json['img_url'] as String;
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'goods_id': instance.goods_id,
      'img_url': instance.img_url,
    };
