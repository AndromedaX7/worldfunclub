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
    ..isHome = json['category_id'] as bool ?? false
    ..categoryId = json['categoryId'] as String
    ..name = json['name'] as String
    ..parentId = json['parent_id'] as String
    ..categoryType = json['category_type'] as String
    ..imageId = json['image_id'] as String
    ..sort = json['sort'] as String
    ..createTime = json['create_time'] as String
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
      'category_id': instance.isHome,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'parent_id': instance.parentId,
      'category_type': instance.categoryType,
      'image_id': instance.imageId,
      'sort': instance.sort,
      'create_time': instance.createTime,
      'image': instance.image,
      'child': instance.child,
    };

HomeCategoryImage _$HomeCategoryImageFromJson(Map<String, dynamic> json) {
  return HomeCategoryImage()..filePath = json['file_path'] as String;
}

Map<String, dynamic> _$HomeCategoryImageToJson(HomeCategoryImage instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
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
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..specType = json['spec_type'] as String
    ..shopId = json['shop_id'] as String
    ..isShop = json['is_shop'] as String
    ..categoryId = json['category_id'] as String
    ..goodsType = json['goods_type'] as String
    ..goodsSkuId = json['goods_sku_id'] as String
    ..goodsPrice = json['goods_price'] as String
    ..linePrice = json['line_price'] as String
    ..stockNum = json['stock_num'] as String
    ..goodsSales = json['goods_sales'] as String
    ..goodsImage = json['goods_image'] as String;
}

Map<String, dynamic> _$HomeCategoryGoodsToJson(HomeCategoryGoods instance) =>
    <String, dynamic>{
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'spec_type': instance.specType,
      'shop_id': instance.shopId,
      'is_shop': instance.isShop,
      'category_id': instance.categoryId,
      'goods_type': instance.goodsType,
      'goods_sku_id': instance.goodsSkuId,
      'goods_price': instance.goodsPrice,
      'line_price': instance.linePrice,
      'stock_num': instance.stockNum,
      'goods_sales': instance.goodsSales,
      'goods_image': instance.goodsImage,
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
    ..goodsId = json['goods_id'] as String
    ..imgUrl = json['img_url'] as String;
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'goods_id': instance.goodsId,
      'img_url': instance.imgUrl,
    };
