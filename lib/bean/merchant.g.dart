// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WriteOffResp _$WriteOffRespFromJson(Map<String, dynamic> json) {
  return WriteOffResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : WriteOffData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WriteOffRespToJson(WriteOffResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

WriteOffData _$WriteOffDataFromJson(Map<String, dynamic> json) {
  return WriteOffData()
    ..orderId = json['order_id'] as String
    ..orderNo = json['order_no'] as String
    ..totalPrice = json['total_price'] as String
    ..shopName = json['shop_name'] as String
    ..stateText = json['state_text'] as String
    ..orderStatus = json['lh_order_status'] as String
    ..startTime = json['lh_start_time'] as String
    ..endTime = json['lh_end_time'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) => e == null
            ? null
            : WriteOffGoods.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WriteOffDataToJson(WriteOffData instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'total_price': instance.totalPrice,
      'shop_name': instance.shopName,
      'state_text': instance.stateText,
      'lh_order_status': instance.orderStatus,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
      'goods': instance.goods,
    };

WriteOffGoods _$WriteOffGoodsFromJson(Map<String, dynamic> json) {
  return WriteOffGoods()
    ..orderGoodsId = json['order_goods_id'] as String
    ..goodsId = json['goods_id'] as String
    ..goodsName = json['goods_name'] as String
    ..price = json['goods_price'] as String
    ..totalNumber = json['total_num'] as String
    ..image = json['image'] as String
    ..goodsAttr = json['goods_attr'] as String;
}

Map<String, dynamic> _$WriteOffGoodsToJson(WriteOffGoods instance) =>
    <String, dynamic>{
      'order_goods_id': instance.orderGoodsId,
      'goods_id': instance.goodsId,
      'goods_name': instance.goodsName,
      'goods_price': instance.price,
      'total_num': instance.totalNumber,
      'image': instance.image,
      'goods_attr': instance.goodsAttr,
    };

ShopBalanceResp _$ShopBalanceRespFromJson(Map<String, dynamic> json) {
  return ShopBalanceResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : ShopBalanceData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ShopBalanceRespToJson(ShopBalanceResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ShopBalanceData _$ShopBalanceDataFromJson(Map<String, dynamic> json) {
  return ShopBalanceData()..shopBalance = json['shop_balance'] as String;
}

Map<String, dynamic> _$ShopBalanceDataToJson(ShopBalanceData instance) =>
    <String, dynamic>{
      'shop_balance': instance.shopBalance,
    };

BankListResp _$BankListRespFromJson(Map<String, dynamic> json) {
  return BankListResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : BankListData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BankListRespToJson(BankListResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

BankListData _$BankListDataFromJson(Map<String, dynamic> json) {
  return BankListData()
    ..bankcardId = json['bankcard_id'] as String
    ..bankName = json['bank_name'] as String
    ..bankCard = json['bank_card'] as String
    ..bankAccount = json['bank_account'] as String;
}

Map<String, dynamic> _$BankListDataToJson(BankListData instance) =>
    <String, dynamic>{
      'bankcard_id': instance.bankcardId,
      'bank_name': instance.bankName,
      'bank_card': instance.bankCard,
      'bank_account': instance.bankAccount,
    };

WithdrawRecordListResp _$WithdrawRecordListRespFromJson(
    Map<String, dynamic> json) {
  return WithdrawRecordListResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : WithdrawRecordListData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WithdrawRecordListRespToJson(
        WithdrawRecordListResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

WithdrawRecordListData _$WithdrawRecordListDataFromJson(
    Map<String, dynamic> json) {
  return WithdrawRecordListData()
    ..desc = json['desc'] as String
    ..setTime = json['set_time'] as String
    ..money = json['money'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$WithdrawRecordListDataToJson(
        WithdrawRecordListData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'set_time': instance.setTime,
      'money': instance.money,
      'type': instance.type,
    };

ScanInfoResp _$ScanInfoRespFromJson(Map<String, dynamic> json) {
  return ScanInfoResp()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : ScanInfoData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ScanInfoRespToJson(ScanInfoResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ScanInfoData _$ScanInfoDataFromJson(Map<String, dynamic> json) {
  return ScanInfoData()
    ..orderId = json['order_id'] as String
    ..writeOff = json['write_off'] as String
    ..orderNo = json['order_no'] as String
    ..totalNum = json['total_num'] as String
    ..name = json['name'] as String
    ..goodsName = json['goods_name'] as String
    ..writeOffNum = json['writeOff_num'] as String
    ..phone = json['phone'] as String
    ..startTime = json['lh_start_time'] as String
    ..endTime = json['lh_end_time'] as String;
}

Map<String, dynamic> _$ScanInfoDataToJson(ScanInfoData instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'write_off': instance.writeOff,
      'order_no': instance.orderNo,
      'total_num': instance.totalNum,
      'name': instance.name,
      'goods_name': instance.goodsName,
      'writeOff_num': instance.writeOffNum,
      'phone': instance.phone,
      'lh_start_time': instance.startTime,
      'lh_end_time': instance.endTime,
    };
