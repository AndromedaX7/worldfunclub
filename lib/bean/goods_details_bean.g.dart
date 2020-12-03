// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_details_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailsBean _$GoodsDetailsBeanFromJson(Map<String, dynamic> json) {
  return GoodsDetailsBean()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : GoodsData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GoodsDetailsBeanToJson(GoodsDetailsBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

GoodsData _$GoodsDataFromJson(Map<String, dynamic> json) {
  return GoodsData()
    ..goods_id = json['goods_id'] as String ?? ''
    ..goods_name = json['goods_name'] as String ?? ''
    ..selling_point = json['selling_point'] as String ?? ''
    ..category_id = json['category_id'] as String ?? ''
    ..goods_type = json['goods_type'] as String ?? ''
    ..spec_type = json['spec_type'] as String ?? ''
    ..content = json['content'] as String ?? ''
    ..is_shop = json['is_shop'] as String ?? ''
    ..shop_id = json['shop_id'] as String ?? ''
    ..subscribe = json['subscribe'] as String ?? ''
    ..lh_start_time = json['lh_start_time'] as String ?? ''
    ..lh_end_time = json['lh_end_time'] as String ?? ''
    ..goods_sales = json['goods_sales'] as String ?? ''
    ..collected_status = json['collected_status'] as String ?? ''
    ..comment_data_count = json['comment_data_count'] as String ?? ''
    ..cart_total_num = json['cart_total_num'] as String ?? ''
    ..comment_data = (json['comment_data'] as List)
        ?.map((e) =>
            e == null ? null : CommentData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..goods_images =
        (json['goods_images'] as List)?.map((e) => e as String)?.toList() ?? []
    ..spec_attr = (json['spec_attr'] as List)
        ?.map((e) =>
            e == null ? null : SpecAttrBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sku_list = (json['sku_list'] as List)
        ?.map((e) =>
            e == null ? null : SkuListBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GoodsDataToJson(GoodsData instance) => <String, dynamic>{
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'selling_point': instance.selling_point,
      'category_id': instance.category_id,
      'goods_type': instance.goods_type,
      'spec_type': instance.spec_type,
      'content': instance.content,
      'is_shop': instance.is_shop,
      'shop_id': instance.shop_id,
      'subscribe': instance.subscribe,
      'lh_start_time': instance.lh_start_time,
      'lh_end_time': instance.lh_end_time,
      'goods_sales': instance.goods_sales,
      'collected_status': instance.collected_status,
      'comment_data_count': instance.comment_data_count,
      'cart_total_num': instance.cart_total_num,
      'comment_data': instance.comment_data,
      'goods_images': instance.goods_images,
      'spec_attr': instance.spec_attr,
      'sku_list': instance.sku_list,
    };

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return CommentData()
    ..comment_id = json['comment_id'] as String
    ..star = json['star'] as String
    ..content = json['content'] as String
    ..create_time = json['create_time'] as String
    ..user_id = json['user_id'] as String
    ..nickName = json['nickName'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList()
    ..goods_attr = json['goods_attr'] as String
    ..thumb_num = json['thumb_num'] as String
    ..is_thumb = json['is_thumb'] as String;
}

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'comment_id': instance.comment_id,
      'star': instance.star,
      'content': instance.content,
      'create_time': instance.create_time,
      'user_id': instance.user_id,
      'nickName': instance.nickName,
      'avatarUrl': instance.avatarUrl,
      'images': instance.images,
      'goods_attr': instance.goods_attr,
      'thumb_num': instance.thumb_num,
      'is_thumb': instance.is_thumb,
    };

SpecAttrBean _$SpecAttrBeanFromJson(Map<String, dynamic> json) {
  return SpecAttrBean()
    ..group_id = json['group_id'] as String
    ..group_name = json['group_name'] as String
    ..spec_items = (json['spec_items'] as List)
        ?.map((e) => e == null
            ? null
            : SpecItemsBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SpecAttrBeanToJson(SpecAttrBean instance) =>
    <String, dynamic>{
      'group_id': instance.group_id,
      'group_name': instance.group_name,
      'spec_items': instance.spec_items,
    };

SkuListBean _$SkuListBeanFromJson(Map<String, dynamic> json) {
  return SkuListBean()
    ..goods_sku_id = json['goods_sku_id'] as String
    ..goods_id = json['goods_id'] as String
    ..spec_sku_id = json['spec_sku_id'] as String
    ..image_id = json['image_id'] as String
    ..goods_no = json['goods_no'] as String
    ..goods_price = json['goods_price'] as String
    ..line_price = json['line_price'] as String
    ..stock_num = json['stock_num'] as String
    ..goods_sales = json['goods_sales'] as String
    ..goods_weight = json['goods_weight'] as String
    ..image = json['image'] as String;
}

Map<String, dynamic> _$SkuListBeanToJson(SkuListBean instance) =>
    <String, dynamic>{
      'goods_sku_id': instance.goods_sku_id,
      'goods_id': instance.goods_id,
      'spec_sku_id': instance.spec_sku_id,
      'image_id': instance.image_id,
      'goods_no': instance.goods_no,
      'goods_price': instance.goods_price,
      'line_price': instance.line_price,
      'stock_num': instance.stock_num,
      'goods_sales': instance.goods_sales,
      'goods_weight': instance.goods_weight,
      'image': instance.image,
    };

SpecItemsBean _$SpecItemsBeanFromJson(Map<String, dynamic> json) {
  return SpecItemsBean()
    ..item_id = json['item_id'] as String
    ..spec_value = json['spec_value'] as String;
}

Map<String, dynamic> _$SpecItemsBeanToJson(SpecItemsBean instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
      'spec_value': instance.spec_value,
    };

LiveGoodsDetailsResp _$LiveGoodsDetailsRespFromJson(Map<String, dynamic> json) {
  return LiveGoodsDetailsResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : LiveGoodsDetailsData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LiveGoodsDetailsRespToJson(
        LiveGoodsDetailsResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

LiveGoodsDetailsData _$LiveGoodsDetailsDataFromJson(Map<String, dynamic> json) {
  return LiveGoodsDetailsData()
    ..goods_id = json['goods_id'] as String ?? ''
    ..goods_name = json['goods_name'] as String ?? ''
    ..selling_point = json['selling_point'] as String ?? ''
    ..category_id = json['category_id'] as String ?? ''
    ..goods_type = json['goods_type'] as String ?? ''
    ..spec_type = json['spec_type'] as String ?? ''
    ..content = json['content'] as String ?? ''
    ..is_shop = json['is_shop'] as String ?? ''
    ..shop_id = json['shop_id'] as String ?? ''
    ..subscribe = json['subscribe'] as String ?? ''
    ..lh_start_time = json['lh_start_time'] as String ?? ''
    ..lh_end_time = json['lh_end_time'] as String ?? ''
    ..goods_sales = json['goods_sales'] as String ?? ''
    ..collected_status = json['collected_status'] as String ?? ''
    ..comment_data_count = json['comment_data_count'] as String ?? ''
    ..cart_total_num = json['cart_total_num'] as String ?? ''
    ..comment_data = (json['comment_data'] as List)
        ?.map((e) =>
            e == null ? null : CommentData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..goods_images =
        (json['goods_images'] as List)?.map((e) => e as String)?.toList() ?? []
    ..spec_attr = (json['spec_attr'] as List)
        ?.map((e) =>
            e == null ? null : SpecAttrBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sku_list = (json['sku_list'] as List)
        ?.map((e) =>
            e == null ? null : SkuListBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..shopInfo = json['shopInfo'] == null
        ? null
        : LiveShopInfo.fromJson(json['shopInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LiveGoodsDetailsDataToJson(
        LiveGoodsDetailsData instance) =>
    <String, dynamic>{
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'selling_point': instance.selling_point,
      'category_id': instance.category_id,
      'goods_type': instance.goods_type,
      'spec_type': instance.spec_type,
      'content': instance.content,
      'is_shop': instance.is_shop,
      'shop_id': instance.shop_id,
      'subscribe': instance.subscribe,
      'lh_start_time': instance.lh_start_time,
      'lh_end_time': instance.lh_end_time,
      'goods_sales': instance.goods_sales,
      'collected_status': instance.collected_status,
      'comment_data_count': instance.comment_data_count,
      'cart_total_num': instance.cart_total_num,
      'comment_data': instance.comment_data,
      'goods_images': instance.goods_images,
      'spec_attr': instance.spec_attr,
      'sku_list': instance.sku_list,
      'shopInfo': instance.shopInfo,
    };

LiveShopInfo _$LiveShopInfoFromJson(Map<String, dynamic> json) {
  return LiveShopInfo()
    ..shop_id = json['shop_id'] as String ?? ''
    ..shop_name = json['shop_name'] as String ?? ''
    ..phone = json['phone'] as String ?? ''
    ..shop_hours = json['shop_hours'] as String ?? ''
    ..address = json['address'] as String ?? ''
    ..longitude = json['longitude'] as String ?? ''
    ..latitude = json['latitude'] as String ?? ''
    ..logo = json['logo'] as String ?? ''
    ..province = json['province'] as String ?? ''
    ..city = json['city'] as String ?? ''
    ..region = json['region'] as String ?? '';
}

Map<String, dynamic> _$LiveShopInfoToJson(LiveShopInfo instance) =>
    <String, dynamic>{
      'shop_id': instance.shop_id,
      'shop_name': instance.shop_name,
      'phone': instance.phone,
      'shop_hours': instance.shop_hours,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'logo': instance.logo,
      'province': instance.province,
      'city': instance.city,
      'region': instance.region,
    };
