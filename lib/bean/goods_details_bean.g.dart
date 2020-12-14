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
    ..goodsId = json['goods_id'] as String ?? ''
    ..goodsName = json['goods_name'] as String ?? ''
    ..sellingPoint = json['selling_point'] as String ?? ''
    ..categoryId = json['category_id'] as String ?? ''
    ..goodsType = json['goods_type'] as String ?? ''
    ..specType = json['spec_type'] as String ?? ''
    ..content = json['content'] as String ?? ''
    ..isShop = json['is_shop'] as String ?? ''
    ..shopId = json['shop_id'] as String ?? ''
    ..subscribe = json['subscribe'] as String ?? ''
    ..startTime = json['lh_start_time'] as String ?? ''
    ..endTime = json['lh_end_time'] as String ?? ''
    ..goodsSales = json['goods_sales'] as String ?? ''
    ..collectedStatus = json['collected_status'] as String ?? ''
    ..commentDataCount = json['comment_data_count'] as String ?? ''
    ..cartTotalNum = json['cart_total_num'] as String ?? ''
    ..commentData = (json['comment_data'] as List)
            ?.map((e) => e == null
                ? null
                : CommentData.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        []
    ..goodsImages =
        (json['goods_images'] as List)?.map((e) => e as String)?.toList() ?? []
    ..specAttr = (json['spec_attr'] as List)
        ?.map((e) =>
            e == null ? null : SpecAttrBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..skuList = (json['sku_list'] as List)
        ?.map((e) =>
            e == null ? null : SkuListBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GoodsDataToJson(GoodsData instance) => <String, dynamic>{
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'selling_point': instance.sellingPoint,
      'category_id': instance.categoryId,
      'goods_type': instance.goodsType,
      'spec_type': instance.specType,
      'content': instance.content,
      'is_shop': instance.isShop,
      'shop_id': instance.shopId,
      'subscribe': instance.subscribe,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
      'goods_sales': instance.goodsSales,
      'collected_status': instance.collectedStatus,
      'comment_data_count': instance.commentDataCount,
      'cart_total_num': instance.cartTotalNum,
      'comment_data': instance.commentData,
      'goods_images': instance.goodsImages,
      'spec_attr': instance.specAttr,
      'sku_list': instance.skuList,
    };

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return CommentData()
    ..commentId = json['comment_id'] as String
    ..star = json['star'] as String
    ..content = json['content'] as String
    ..createTime = json['create_time'] as String
    ..userId = json['user_id'] as String
    ..nickName = json['nickName'] as String ?? ''
    ..avatarUrl = json['avatarUrl'] as String ?? ''
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList()
    ..goodsAttr = json['goods_attr'] as String
    ..thumbNum = json['thumb_num'] as String
    ..isThumb = json['is_thumb'] as String;
}

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'star': instance.star,
      'content': instance.content,
      'create_time': instance.createTime,
      'user_id': instance.userId,
      'nickName': instance.nickName,
      'avatarUrl': instance.avatarUrl,
      'images': instance.images,
      'goods_attr': instance.goodsAttr,
      'thumb_num': instance.thumbNum,
      'is_thumb': instance.isThumb,
    };

CommentDataList _$CommentDataListFromJson(Map<String, dynamic> json) {
  return CommentDataList()
    ..commentId = json['comment_id'] as String
    ..star = json['star'] as String
    ..content = json['content'] as String
    ..createTime = json['create_time'] as String
    ..userId = json['user_id'] as String
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList()
    ..goodsAttr = json['goods_attr'] as String
    ..thumbNum = json['thumb_num'] as String
    ..isThumb = json['is_thumb'] as String
    ..nickName = json['nickname'] as String ?? ''
    ..avatarUrl = json['avatar'] as String ?? '';
}

Map<String, dynamic> _$CommentDataListToJson(CommentDataList instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'star': instance.star,
      'content': instance.content,
      'create_time': instance.createTime,
      'user_id': instance.userId,
      'images': instance.images,
      'goods_attr': instance.goodsAttr,
      'thumb_num': instance.thumbNum,
      'is_thumb': instance.isThumb,
      'nickname': instance.nickName,
      'avatar': instance.avatarUrl,
    };

CommentPageData _$CommentPageDataFromJson(Map<String, dynamic> json) {
  return CommentPageData()
    ..list = (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : CommentDataList.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..all = json['all_num'] as String ?? '0'
    ..praise = json['praise_num'] as String ?? '0'
    ..review = json['review_num'] as String ?? '0'
    ..negative = json['negative_num'] as String ?? '0'
    ..picture = json['picture_num'] as String ?? '0';
}

Map<String, dynamic> _$CommentPageDataToJson(CommentPageData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'all_num': instance.all,
      'praise_num': instance.praise,
      'review_num': instance.review,
      'negative_num': instance.negative,
      'picture_num': instance.picture,
    };

CommentResp _$CommentRespFromJson(Map<String, dynamic> json) {
  return CommentResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : CommentPageData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentRespToJson(CommentResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

SpecAttrBean _$SpecAttrBeanFromJson(Map<String, dynamic> json) {
  return SpecAttrBean()
    ..groupId = json['group_id'] as String
    ..groupName = json['group_name'] as String
    ..selected = json['selected'] as int ?? 0
    ..specItems = (json['spec_items'] as List)
        ?.map((e) => e == null
            ? null
            : SpecItemsBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SpecAttrBeanToJson(SpecAttrBean instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'group_name': instance.groupName,
      'selected': instance.selected,
      'spec_items': instance.specItems,
    };

SkuListBean _$SkuListBeanFromJson(Map<String, dynamic> json) {
  return SkuListBean()
    ..goodsSkuId = json['goods_sku_id'] as String
    ..goodsId = json['goods_id'] as String
    ..specSkuId = json['spec_sku_id'] as String
    ..imageId = json['image_id'] as String
    ..goodsNo = json['goods_no'] as String
    ..goodsPrice = json['goods_price'] as String
    ..linePrice = json['line_price'] as String
    ..stockNum = json['stock_num'] as String
    ..goodsSales = json['goods_sales'] as String
    ..goodsWeight = json['goods_weight'] as String
    ..image = json['image'] as String;
}

Map<String, dynamic> _$SkuListBeanToJson(SkuListBean instance) =>
    <String, dynamic>{
      'goods_sku_id': instance.goodsSkuId,
      'goods_id': instance.goodsId,
      'spec_sku_id': instance.specSkuId,
      'image_id': instance.imageId,
      'goods_no': instance.goodsNo,
      'goods_price': instance.goodsPrice,
      'line_price': instance.linePrice,
      'stock_num': instance.stockNum,
      'goods_sales': instance.goodsSales,
      'goods_weight': instance.goodsWeight,
      'image': instance.image,
    };

SpecItemsBean _$SpecItemsBeanFromJson(Map<String, dynamic> json) {
  return SpecItemsBean()
    ..itemId = json['item_id'] as String
    ..specValue = json['spec_value'] as String;
}

Map<String, dynamic> _$SpecItemsBeanToJson(SpecItemsBean instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'spec_value': instance.specValue,
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
    ..goodsId = json['goods_id'] as String ?? ''
    ..goodsName = json['goods_name'] as String ?? ''
    ..sellingPoint = json['selling_point'] as String ?? ''
    ..categoryId = json['category_id'] as String ?? ''
    ..goodsType = json['goods_type'] as String ?? ''
    ..specType = json['spec_type'] as String ?? ''
    ..content = json['content'] as String ?? ''
    ..isShop = json['is_shop'] as String ?? ''
    ..shopId = json['shop_id'] as String ?? ''
    ..subscribe = json['subscribe'] as String ?? ''
    ..startTime = json['lh_start_time'] as String ?? ''
    ..endTime = json['lh_end_time'] as String ?? ''
    ..goodsSales = json['goods_sales'] as String ?? ''
    ..collectedStatus = json['collected_status'] as String ?? ''
    ..commentDataCount = json['comment_data_count'] as String ?? ''
    ..cartTotalNum = json['cart_total_num'] as String ?? ''
    ..commentData = (json['comment_data'] as List)
            ?.map((e) => e == null
                ? null
                : CommentData.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        []
    ..goodsImages =
        (json['goods_images'] as List)?.map((e) => e as String)?.toList() ?? []
    ..specAttr = (json['spec_attr'] as List)
        ?.map((e) =>
            e == null ? null : SpecAttrBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..skuList = (json['sku_list'] as List)
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
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'selling_point': instance.sellingPoint,
      'category_id': instance.categoryId,
      'goods_type': instance.goodsType,
      'spec_type': instance.specType,
      'content': instance.content,
      'is_shop': instance.isShop,
      'shop_id': instance.shopId,
      'subscribe': instance.subscribe,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
      'goods_sales': instance.goodsSales,
      'collected_status': instance.collectedStatus,
      'comment_data_count': instance.commentDataCount,
      'cart_total_num': instance.cartTotalNum,
      'comment_data': instance.commentData,
      'goods_images': instance.goodsImages,
      'spec_attr': instance.specAttr,
      'sku_list': instance.skuList,
      'shopInfo': instance.shopInfo,
    };

LiveShopInfo _$LiveShopInfoFromJson(Map<String, dynamic> json) {
  return LiveShopInfo()
    ..shopId = json['shop_id'] as String ?? ''
    ..shopName = json['shop_name'] as String ?? ''
    ..phone = json['phone'] as String ?? ''
    ..shopHours = json['shop_hours'] as String ?? ''
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
      'shop_id': instance.shopId,
      'shop_name': instance.shopName,
      'phone': instance.phone,
      'shop_hours': instance.shopHours,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'logo': instance.logo,
      'province': instance.province,
      'city': instance.city,
      'region': instance.region,
    };
