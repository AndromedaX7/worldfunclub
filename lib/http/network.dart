import 'dart:typed_data';

import 'package:worldfunclub/http/http.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/utils/log.dart';

class Api {
  String _baseUrl = "http://shop.tule-live.com/index.php";

  Stream<dynamic> loginWithWechat(String code) {
    return post2("$_baseUrl/api/Login/wechatLogin", params: {"token": code});
  }

  Stream<dynamic> sendAuthCodeWithLogin(String phone) {
    return post2("$_baseUrl/api/Login/sendMessage",
        params: {"mobile_number": phone, "type": 2});
  }

  Stream<dynamic> login(String phone, String code) {
    return post2("$_baseUrl/api/Login/mobileLogin",
        params: {"mobile_number": phone, "verify_code": code});
  }

  Stream<dynamic> homeCategory() {
    return get("$_baseUrl/api/Category/index");
  }

  Stream<dynamic> addressList() {
    return post2("$_baseUrl/api/Address/lists",
        params: {"user_id": userId, "login_token": loginToken});
  }

  Stream<dynamic> editAddress(String addressId, String region, String name,
      String phone, String detail, bool isDefault) {
    return post2("$_baseUrl/api/Address/edit", params: {
      "address_id": addressId,
      "user_id": userId,
      "login_token": loginToken,
      "region": region,
      "name": name,
      "phone": phone,
      "detail": detail,
      "is_default": isDefault ? "2" : "1",
    });
  }

  Stream<dynamic> addAddress(
      String region, String name, String phone, String detail, bool isDefault) {
    return post2("$_baseUrl/api/Address/add", params: {
      "user_id": userId,
      "login_token": loginToken,
      "region": region,
      "name": name,
      "phone": phone,
      "detail": detail,
      "is_default": isDefault ? "2" : "1",
    });
  }

  Stream<dynamic> deleteAddress(String id) {
    return post2("$_baseUrl/api/Address/delete", params: {
      "user_id": userId,
      "login_token": loginToken,
      "address_id": id,
    });
  }

  //suspend fun banner(category_id: String, rotation_type: String): BannerData
  Stream<dynamic> banner(String categoryId, String rotationType) {
    return post2("$_baseUrl/api/Rotation/lists",
        params: {"category_id": categoryId, "rotation_type": rotationType});
  }

  Stream<dynamic> categoryGoods(
      String category_id, bool self, String choice, int page) {
    return post2("$_baseUrl/api/Goods/lists", params: {
      "category_id": category_id,
      "goods_type": self ? 1 : 2,
      "choice": choice,
      "page": page
    });
  }

  Stream<dynamic> orderList(
      int page, OrderType orderType, GoodsType goodsType) {
    return post2("$_baseUrl/api/user.order/lists", params: {
      "user_id": userId,
      "login_token": loginToken,
      "page": page,
      "source": goodsType.value,
      "order_type": orderType.typeName
    });
  }

  Stream<dynamic> goodsDetails(
    String id,
  ) {
    return post2("$_baseUrl/api/Goods/detail",
        params: {"goods_id": id, "user_id": userId, "login_token": loginToken});
  }

  Stream<dynamic> cartList() {
    return post2("$_baseUrl/api/Cart/lists",
        params: {"user_id": userId, "login_token": loginToken});
  }

  Stream<dynamic> loadActiveList() {
    return post2("$_baseUrl/api/Activity/lists", params: {"type": 1});
  }

  Stream<dynamic> loadActiveGoods(
      String activity_sign, String activity_id, int page,
      {String query}) {
    return post2("$_baseUrl/api/Activity/details", params: {
      "activity_sign": activity_sign,
      "activity_id": activity_id,
      "page": page,
      "query": query
    });
  }

  Stream<dynamic> searchGoods(GoodsType type, String query, int page) {
    return post2("$_baseUrl/api/Goods/getSearchGoods", params: {
      "goods_type": type.value,
      "search": query,
      "page": page,
      "user_id": userId,
      "login_token": loginToken
    });
  }

  Stream<dynamic> orderDetails(String orderId) {
    return post2("$_baseUrl/api/user.order/detail", params: {
      "order_id": orderId,
      "user_id": userId,
      "login_token": loginToken
    });
  }

  Stream<dynamic> recommendGoods() {
    return post("$_baseUrl/api/Goods/recommendGoods");
  }

  Stream<dynamic> userBalance() {
    return post("$_baseUrl/api/user/userBalance",
        params: {"user_id": userId, "login_token": loginToken});
  }

  Stream<dynamic> increaseCartNum(String type, String cart_id) {
    return post2("$_baseUrl/api/Cart/handleGoodsNum", params: {
      "cart_id": cart_id,
      "type": type,
      "user_id": userId,
      "login_token": loginToken
    });
  }

  Stream<dynamic> delCart(List<String> cartIds) {
    return post2("$_baseUrl/api/Cart/deleteCart", params: {
      "user_id": userId,
      "cart_ids": cartIds.join(","),
      "login_token": loginToken
    });
  }

  Stream<dynamic> getCollectList(int page) {
    return post2("$_baseUrl/api/Collection/getCollectionList",
        params: {"user_id": userId, "login_token": loginToken, "page": page});
  }

  Stream<dynamic> deleteCollection(String collectId) {
    return post2("$_baseUrl/api/Collection/deleteCollection", params: {
      "user_id": userId,
      "login_token": loginToken,
      "collect_id": collectId,
    });
  }

  Stream<dynamic> liveGoodsDetails(String goodsId) {
    return post2("$_baseUrl/api/Goods/detail", params: {
      "goods_id": goodsId,
      "user_id": userId,
      "login_token": loginToken
    });
  }

  Stream<dynamic> checkCouldAfterSale(String orderGoodsId) {
    return post2("$_baseUrl/api/user.refund/isApply", params: {
      "user_id": userId,
      "login_token": loginToken,
      "order_goods_id": orderGoodsId
    });
  }

  Stream<dynamic> refundReason() {
    return get("$_baseUrl/api/user.refund/getRefundReason",
        params: {"user_id": userId, "login_token": loginToken});
  }

  Stream<dynamic> refundApply(
      String orderGoodsId, bool show, String reason, double refundPrice) {
    return post2("$_baseUrl/api/user.refund/apply", params: {
      "user_id": userId,
      "login_token": loginToken,
      "order_goods_id": orderGoodsId,
      "type": show ? 10 : 20,
      "reason": reason,
      "refund_price": refundPrice,
      "apply[0]": Uint8List(0),
      "apply[1]": Uint8List(0),
      "apply[2]": Uint8List(0),
      "refund_desc": "refund_desc",
      "user_mobile": "138后头随便",
      "is_need_send": show ? 10 : 20
    });
  }

  Stream<dynamic> refundList(String type) {
    return post2("$_baseUrl/api/user.refund/lists",
        params: {"user_id": userId, "login_token": loginToken, "type": type});
  }

// val resp = api.liveBuyNow(
//         app.wxInfo!!.user_id,
//         app.wxInfo!!.login_token,
//         data.goods_id,
//         total_num,
//         data.skuId,
//         findPayType().value,
//         (total_num * data.goodsPrice).toDouble().toYuan(),
//         name,
//         phone,
//         (subscribeDate.toDateMillis("yyyy-MM-dd HH:mm") / 1000).toString(),
//         remark
//     )
//     val resp = api.liveBuyNow(
//         app.wxInfo!!.user_id,
//         app.wxInfo!!.login_token,
//         data.goods_id,
//         total_num,
//         data.skuId,
//         findPayType().value,
//         (total_num * data.goodsPrice).toDouble().toYuan(),
//         name,
//         phone,
//         (subscribeDate.toDateMillis("yyyy-MM-dd HH:mm") / 1000).toString(),
//         remark
//     )
  Stream<dynamic> liveBuy(
      String goodsId,
      int count,
      String skuId,
      String payType,
      double payPrice,
      String name,
      String phone,
      String date,
      String remark) {
    Log.d(payPrice);
    return post2("$_baseUrl/api/order/lhBuyNow", params: {
      "user_id": userId,
      "login_token": loginToken,
      "goods_id": goodsId,
      "goods_num": count,
      "goods_sku_id": skuId,
      "pay_type": payType,
      "goods_money": payPrice,
      "name": name,
      "phone": phone,
      "subscribe_date": date,
      "remark": remark,
      "goods_type": "2",
    });
  }

  Stream<dynamic> orderAuth(int payPrefix, String orderId) {
    return post2("$_baseUrl/api/order/orderAuth", params: {
      "user_id": userId,
      "order_id": orderId,
      "login_token": loginToken,
      "pay_type": payPrefix,
    });
  }
  Stream <dynamic> footprint(int page){
    return post2("$_baseUrl/api/Visit/getVisitList",params: {
      "user_id":userId,
      "login_token":loginToken,
      "page":page
    });
  }


  Stream<dynamic> addCart(String goodsId,int num  ,String skuId  ){
    return post2("$_baseUrl/api/Cart/add",params: {
      "goods_id":goodsId,
      "goods_sku_id":skuId,
      "goods_num": num,
      "user_id": userId,
      "login_token":loginToken
    });
  }
}

Api api = Api();
