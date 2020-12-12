// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) {
  return OrderList()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : OrderData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData()
    ..orderId = json['order_id'] as String
    ..orderNo = json['order_no'] as String
    ..goodsNum = json['goods_num'] as String
    ..shopName = json['shop_name'] as String
    ..stateText = json['state_text'] as String
    ..orderStatus = json['order_status'] as String
    ..lhOrderStatus = json['lh_order_status'] as String
    ..totalPrice = json['total_price'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) =>
            e == null ? null : OrderGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'goods_num': instance.goodsNum,
      'shop_name': instance.shopName,
      'state_text': instance.stateText,
      'order_status': instance.orderStatus,
      'lh_order_status': instance.lhOrderStatus,
      'total_price': instance.totalPrice,
      'goods': instance.goods,
    };

OrderGoods _$OrderGoodsFromJson(Map<String, dynamic> json) {
  return OrderGoods()
    ..orderGoodsId = json['order_goods_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..goodsPrice = json['goods_price'] as String
    ..totalNum = json['total_num'] as String
    ..image = json['image'] as String
    ..goodsAttr = json['goods_attr'] as String;
}

Map<String, dynamic> _$OrderGoodsToJson(OrderGoods instance) =>
    <String, dynamic>{
      'order_goods_id': instance.orderGoodsId,
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'goods_price': instance.goodsPrice,
      'total_num': instance.totalNum,
      'image': instance.image,
      'goods_attr': instance.goodsAttr,
    };

OrderDetailsResp _$OrderDetailsRespFromJson(Map<String, dynamic> json) {
  return OrderDetailsResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : OrderDetailsData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderDetailsRespToJson(OrderDetailsResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderDetailsData _$OrderDetailsDataFromJson(Map<String, dynamic> json) {
  return OrderDetailsData()
    ..orderId = json['order_id'] as String
    ..orderNo = json['order_no'] as String
    ..orderType = json['order_type'] as String
    ..createTime = json['create_time'] as String
    ..shopName = json['shop_name'] as String
    ..writeOff = json['write_off'] as String
    ..qrCode = json['qrcode'] as String
    ..orderStatus = json['order_status'] as String
    ..lhOrderStatus = json['lh_order_status'] as String
    ..stateText = json['state_text'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..subscribeDate = json['subscribe_date'] as String
    ..startTime = json['lh_start_time'] as String
    ..endTime = json['lh_end_time'] as String
    ..orderAddressId = json['order_address_id'] as String
    ..addressName = json['address_name'] as String
    ..addressPhone = json['address_phone'] as String
    ..addressDetail = json['address_detail'] as String
    ..addressProvince = json['address_province'] as String
    ..addressCity = json['address_city'] as String
    ..addressRegion = json['address_region'] as String
    ..shopId = json['shop_id'] as String
    ..shopHours = json['shop_hours'] as String
    ..shopAddress = json['shop_address'] as String
    ..shopLongitude = json['shop_longitude'] as String
    ..shopLatitude = json['shop_latitude'] as String
    ..shopLogo = json['shop_logo'] as String
    ..shopProvince = json['shop_province'] as String
    ..shopCity = json['shop_city'] as String
    ..shopRegion = json['shop_region'] as String
    ..customerService =
        (json['customer_service'] as List)?.map((e) => e as String)?.toList()
    ..payType = json['pay_type'] as String;
}

Map<String, dynamic> _$OrderDetailsDataToJson(OrderDetailsData instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'order_type': instance.orderType,
      'create_time': instance.createTime,
      'shop_name': instance.shopName,
      'write_off': instance.writeOff,
      'qrcode': instance.qrCode,
      'order_status': instance.orderStatus,
      'lh_order_status': instance.lhOrderStatus,
      'state_text': instance.stateText,
      'name': instance.name,
      'phone': instance.phone,
      'subscribe_date': instance.subscribeDate,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
      'order_address_id': instance.orderAddressId,
      'address_name': instance.addressName,
      'address_phone': instance.addressPhone,
      'address_detail': instance.addressDetail,
      'address_province': instance.addressProvince,
      'address_city': instance.addressCity,
      'address_region': instance.addressRegion,
      'shop_id': instance.shopId,
      'shop_hours': instance.shopHours,
      'shop_address': instance.shopAddress,
      'shop_longitude': instance.shopLongitude,
      'shop_latitude': instance.shopLatitude,
      'shop_logo': instance.shopLogo,
      'shop_province': instance.shopProvince,
      'shop_city': instance.shopCity,
      'shop_region': instance.shopRegion,
      'customer_service': instance.customerService,
      'pay_type': instance.payType,
    };

RefundReasonResp _$RefundReasonRespFromJson(Map<String, dynamic> json) {
  return RefundReasonResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : RefundReasonData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RefundReasonRespToJson(RefundReasonResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

RefundReasonData _$RefundReasonDataFromJson(Map<String, dynamic> json) {
  return RefundReasonData()
    ..refundReason =
        (json['refund_reason'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$RefundReasonDataToJson(RefundReasonData instance) =>
    <String, dynamic>{
      'refund_reason': instance.refundReason,
    };

RefundListResp _$RefundListRespFromJson(Map<String, dynamic> json) {
  return RefundListResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : RefundListData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RefundListRespToJson(RefundListResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

RefundListData _$RefundListDataFromJson(Map<String, dynamic> json) {
  return RefundListData()
    ..orderRefundId = json['order_refund_id'] as String
    ..orderGoodsId = json['order_goods_id'] as String
    ..refundMoney = json['refund_money'] as String
    ..refundStatus = json['refund_status'] as String
    ..refundText = json['refund_text'] as String
    ..goodsName = json['goods_name'] as String
    ..goodsAttr = json['goods_attr'] as String
    ..totalPrice = json['total_price'] as String
    ..totalNum = json['total_num'] as String
    ..goodsImage = json['goods_image'] as String;
}

Map<String, dynamic> _$RefundListDataToJson(RefundListData instance) =>
    <String, dynamic>{
      'order_refund_id': instance.orderRefundId,
      'order_goods_id': instance.orderGoodsId,
      'refund_money': instance.refundMoney,
      'refund_status': instance.refundStatus,
      'refund_text': instance.refundText,
      'goods_name': instance.goodsName,
      'goods_attr': instance.goodsAttr,
      'total_price': instance.totalPrice,
      'total_num': instance.totalNum,
      'goods_image': instance.goodsImage,
    };

OrderCommitResp _$OrderCommitRespFromJson(Map<String, dynamic> json) {
  return OrderCommitResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : OrderCommitData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderCommitRespToJson(OrderCommitResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderCommitData _$OrderCommitDataFromJson(Map<String, dynamic> json) {
  return OrderCommitData()..orderId = json['order_id'] as String;
}

Map<String, dynamic> _$OrderCommitDataToJson(OrderCommitData instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
    };

RefundDetailsResp _$RefundDetailsRespFromJson(Map<String, dynamic> json) {
  return RefundDetailsResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : RefundDetailsData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RefundDetailsRespToJson(RefundDetailsResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

RefundDetailsData _$RefundDetailsDataFromJson(Map<String, dynamic> json) {
  return RefundDetailsData()
    ..refundSpeed = json['refund_speed'] as String ?? ''
    ..speedText = json['speed_text'] as String ?? ''
    ..expressId = json['express_id'] as String ?? ''
    ..expressName = json['express_name'] as String ?? ''
    ..expressNo = json['express_no'] as String ?? ''
    ..type = json['type'] as String ?? ''
    ..userMobile = json['user_mobile'] as String ?? ''
    ..refuseDesc = json['refuse_desc'] as String ?? ''
    ..sellerAddress = json['seller_address'] as String ?? '';
}

Map<String, dynamic> _$RefundDetailsDataToJson(RefundDetailsData instance) =>
    <String, dynamic>{
      'refund_speed': instance.refundSpeed,
      'speed_text': instance.speedText,
      'express_id': instance.expressId,
      'express_name': instance.expressName,
      'express_no': instance.expressNo,
      'type': instance.type,
      'user_mobile': instance.userMobile,
      'refuse_desc': instance.refuseDesc,
      'seller_address': instance.sellerAddress,
    };

RefundCompanyListResp _$RefundCompanyListRespFromJson(
    Map<String, dynamic> json) {
  return RefundCompanyListResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : RefundCompanyData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RefundCompanyListRespToJson(
        RefundCompanyListResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

RefundCompanyData _$RefundCompanyDataFromJson(Map<String, dynamic> json) {
  return RefundCompanyData()
    ..caption = json['caption'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$RefundCompanyDataToJson(RefundCompanyData instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'id': instance.id,
    };

ExpressLineResp _$ExpressLineRespFromJson(Map<String, dynamic> json) {
  return ExpressLineResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : ExpressLineData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ExpressLineRespToJson(ExpressLineResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ExpressLineData _$ExpressLineDataFromJson(Map<String, dynamic> json) {
  return ExpressLineData()
    ..deliveryNo = json['deliveryNo'] as String ?? ''
    ..deliveryName = json['deliveryName'] as String ?? ''
    ..deliveryList = (json['deliveryList'] as List)
            ?.map((e) => e == null
                ? null
                : ExpressDeliveryList.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        []
    ..goodsImage = json['goods_image'] as String ?? '';
}

Map<String, dynamic> _$ExpressLineDataToJson(ExpressLineData instance) =>
    <String, dynamic>{
      'deliveryNo': instance.deliveryNo,
      'deliveryName': instance.deliveryName,
      'deliveryList': instance.deliveryList,
      'goods_image': instance.goodsImage,
    };

ExpressDeliveryList _$ExpressDeliveryListFromJson(Map<String, dynamic> json) {
  return ExpressDeliveryList()
    ..title = json['title'] as String
    ..context = json['context'] as String
    ..time = json['time'] as String
    ..operator = json['operator'] as String;
}

Map<String, dynamic> _$ExpressDeliveryListToJson(
        ExpressDeliveryList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'context': instance.context,
      'time': instance.time,
      'operator': instance.operator,
    };
