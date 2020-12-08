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
    ..order_id = json['order_id'] as String
    ..order_no = json['order_no'] as String
    ..goods_num = json['goods_num'] as String
    ..shop_name = json['shop_name'] as String
    ..state_text = json['state_text'] as String
    ..order_status = json['order_status'] as String
    ..lh_order_status = json['lh_order_status'] as String
    ..total_price = json['total_price'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) =>
            e == null ? null : OrderGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'order_no': instance.order_no,
      'goods_num': instance.goods_num,
      'shop_name': instance.shop_name,
      'state_text': instance.state_text,
      'order_status': instance.order_status,
      'lh_order_status': instance.lh_order_status,
      'total_price': instance.total_price,
      'goods': instance.goods,
    };

OrderGoods _$OrderGoodsFromJson(Map<String, dynamic> json) {
  return OrderGoods()
    ..order_goods_id = json['order_goods_id'] as String
    ..goods_id = json['goods_id'] as String
    ..goods_name = json['goods_name'] as String
    ..goods_price = json['goods_price'] as String
    ..total_num = json['total_num'] as String
    ..image = json['image'] as String
    ..goods_attr = json['goods_attr'] as String;
}

Map<String, dynamic> _$OrderGoodsToJson(OrderGoods instance) =>
    <String, dynamic>{
      'order_goods_id': instance.order_goods_id,
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'goods_price': instance.goods_price,
      'total_num': instance.total_num,
      'image': instance.image,
      'goods_attr': instance.goods_attr,
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
    ..order_id = json['order_id'] as String
    ..order_no = json['order_no'] as String
    ..order_type = json['order_type'] as String
    ..create_time = json['create_time'] as String
    ..shop_name = json['shop_name'] as String
    ..write_off = json['write_off'] as String
    ..qrcode = json['qrcode'] as String
    ..order_status = json['order_status'] as String
    ..lh_order_status = json['lh_order_status'] as String
    ..state_text = json['state_text'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..subscribe_date = json['subscribe_date'] as String
    ..lh_start_time = json['lh_start_time'] as String
    ..lh_end_time = json['lh_end_time'] as String
    ..order_address_id = json['order_address_id'] as String
    ..address_name = json['address_name'] as String
    ..address_phone = json['address_phone'] as String
    ..address_detail = json['address_detail'] as String
    ..address_province = json['address_province'] as String
    ..address_city = json['address_city'] as String
    ..address_region = json['address_region'] as String
    ..shop_id = json['shop_id'] as String
    ..shop_hours = json['shop_hours'] as String
    ..shop_address = json['shop_address'] as String
    ..shop_longitude = json['shop_longitude'] as String
    ..shop_latitude = json['shop_latitude'] as String
    ..shop_logo = json['shop_logo'] as String
    ..shop_province = json['shop_province'] as String
    ..shop_city = json['shop_city'] as String
    ..shop_region = json['shop_region'] as String
    ..customer_service =
        (json['customer_service'] as List)?.map((e) => e as String)?.toList()
    ..pay_type = json['pay_type'] as String;
}

Map<String, dynamic> _$OrderDetailsDataToJson(OrderDetailsData instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'order_no': instance.order_no,
      'order_type': instance.order_type,
      'create_time': instance.create_time,
      'shop_name': instance.shop_name,
      'write_off': instance.write_off,
      'qrcode': instance.qrcode,
      'order_status': instance.order_status,
      'lh_order_status': instance.lh_order_status,
      'state_text': instance.state_text,
      'name': instance.name,
      'phone': instance.phone,
      'subscribe_date': instance.subscribe_date,
      'lh_start_time': instance.lh_start_time,
      'lh_end_time': instance.lh_end_time,
      'order_address_id': instance.order_address_id,
      'address_name': instance.address_name,
      'address_phone': instance.address_phone,
      'address_detail': instance.address_detail,
      'address_province': instance.address_province,
      'address_city': instance.address_city,
      'address_region': instance.address_region,
      'shop_id': instance.shop_id,
      'shop_hours': instance.shop_hours,
      'shop_address': instance.shop_address,
      'shop_longitude': instance.shop_longitude,
      'shop_latitude': instance.shop_latitude,
      'shop_logo': instance.shop_logo,
      'shop_province': instance.shop_province,
      'shop_city': instance.shop_city,
      'shop_region': instance.shop_region,
      'customer_service': instance.customer_service,
      'pay_type': instance.pay_type,
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
    ..refund_reason =
        (json['refund_reason'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$RefundReasonDataToJson(RefundReasonData instance) =>
    <String, dynamic>{
      'refund_reason': instance.refund_reason,
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
  return OrderCommitData()..order_id = json['order_id'] as String;
}

Map<String, dynamic> _$OrderCommitDataToJson(OrderCommitData instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
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
