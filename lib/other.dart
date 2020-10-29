import 'dart:core';

class OrderType {
  final String value;
  final String typeName;

  const OrderType(this.typeName, this.value);

  static const OrderType willPay = OrderType("payment", "10");
  static const OrderType willSend = OrderType("delivered", "20");
  static const OrderType willReceive = OrderType("received", "30");
  static const OrderType willEvaluation = OrderType("comment", "40");
  static const OrderType timeout = OrderType("expire", "40");
  static const OrderType all = OrderType("all", "");
  static const OrderType unknown = OrderType("unknown", "");

  factory OrderType.fromLive(int index) {
    switch (index) {
      case 0:
        return willPay;
      case 1:
        return willSend;
      case 2:
        return willReceive;
      case 3:
        return timeout;
      default:
        return unknown;
    }
  }

  factory OrderType.fromIndex(int index) {
    switch (index) {
      case 0:
        return all;
      case 1:
        return willPay;
      case 2:
        return willSend;
      case 3:
        return willReceive;
      case 4:
        return willEvaluation;
      default:
        return unknown;
    }
  }
}

class GoodsType {
  final String value;

  const GoodsType(this.value);

  static const GoodsType self = GoodsType("1");
  static const GoodsType live = GoodsType("2");
}

// // enum class PayType(val value: String,val payName:String) {
// // WeChat("20","微信支付"),
// // AliPay("-1","支付宝支付"),
// // Self("10","途乐币支付"),
// // Other("undefined","其他支付");
// //
// // companion object {
// // fun decode(payTypeCode: Int): PayType {
// // return when (payTypeCode) {
// // 1 -> WeChat
// // 2 -> AliPay
// // 3 -> Self
// // else -> Other
// // }
// // }
// // fun fromString(text: String): PayType {
// // return when (text) {
// // "10" -> Self
// // "20" -> WeChat
// // "-1" -> AliPay
// // else -> Other
// // }
// // }
// // }
// // }
//
// // enum class GoodsType(val value: String) {
// // Self("1"),
// // Live("2")
// // }
//
// // enum class PayFrom(val value: String) {
// // GoodsDetails("1"),
// // Cart("2")
// // }
//
//
//
