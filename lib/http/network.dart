import 'dart:io';

import 'package:dio/dio.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
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

  Stream<dynamic> sendCodeForBindPhone(String phone) {
    return post2("$_baseUrl/api/Login/sendMessage", params: {
      "user_id": userId,
      "mobile_number": phone,
      "login_token": token,
      "type": 1,
    });
  }

  Stream<dynamic> bindPhone(String phone, String code) {
    return post2("$_baseUrl/api/Login/userBindMobile", params: {
      "user_id": userId,
      "mobile_number": phone,
      "login_token": token,
      "verify_code": code,
    });
  }

  Stream<dynamic> homeCategory() {
    return get("$_baseUrl/api/Category/index");
  }

  Stream<dynamic> addressList() {
    return post2("$_baseUrl/api/Address/lists",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> editAddress(String addressId, String region, String name,
      String phone, String detail, bool isDefault) {
    return post2("$_baseUrl/api/Address/edit", params: {
      "address_id": addressId,
      "user_id": userId,
      "login_token": token,
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
      "login_token": token,
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
      "login_token": token,
      "address_id": id,
    });
  }

  //suspend fun banner(category_id: String, rotation_type: String): BannerData
  Stream<dynamic> banner(String categoryId, String rotationType) {
    return post2("$_baseUrl/api/Rotation/lists",
        params: {"category_id": categoryId, "rotation_type": rotationType});
  }

  Stream<dynamic> categoryGoods(
      String categoryId, bool self, String choice, int page) {
    return post2("$_baseUrl/api/Goods/lists", params: {
      "category_id": categoryId,
      "goods_type": self ? 1 : 2,
      "choice": choice,
      "page": page
    });
  }

  Stream<dynamic> orderList(
      int page, OrderType orderType, GoodsType goodsType) {
    return post2("$_baseUrl/api/user.order/lists", params: {
      "user_id": userId,
      "login_token": token,
      "page": page,
      "source": goodsType.value,
      "order_type": orderType.typeName
    });
  }

  Stream<dynamic> goodsDetails(
    String id,
  ) {
    return post2("$_baseUrl/api/Goods/detail",
        params: {"goods_id": id, "user_id": userId, "login_token": token});
  }

  Stream<dynamic> cartList() {
    return post2("$_baseUrl/api/Cart/lists",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> loadActiveList() {
    return post2("$_baseUrl/api/Activity/lists", params: {"type": 1});
  }

  Stream<dynamic> loadActiveGoods(
      String activitySign, String activityId, int page,
      {String query}) {
    return post2("$_baseUrl/api/Activity/details", params: {
      "activity_sign": activitySign,
      "activity_id": activityId,
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
      "login_token": token
    });
  }

  Stream<dynamic> orderDetails(String orderId) {
    return post2("$_baseUrl/api/user.order/detail",
        params: {"order_id": orderId, "user_id": userId, "login_token": token});
  }

  Stream<dynamic> recommendGoods(int page) {
    return post("$_baseUrl/api/Goods/recommendGoods",params: {"page":page});
  }

  Stream<dynamic> userBalance() {
    return post("$_baseUrl/api/user/userBalance",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> increaseCartNum(String type, String cartId) {
    return post2("$_baseUrl/api/Cart/handleGoodsNum", params: {
      "cart_id": cartId,
      "type": type,
      "user_id": userId,
      "login_token": token
    });
  }

  Stream<dynamic> delCart(List<String> cartIds) {
    return post2("$_baseUrl/api/Cart/deleteCart", params: {
      "user_id": userId,
      "cart_ids": cartIds.join(","),
      "login_token": token
    });
  }

  Stream<dynamic> getCollectList(int page) {
    return post2("$_baseUrl/api/Collection/getCollectionList",
        params: {"user_id": userId, "login_token": token, "page": page});
  }

  Stream<dynamic> deleteCollection(String collectId) {
    return post2("$_baseUrl/api/Collection/deleteCollection", params: {
      "user_id": userId,
      "login_token": token,
      "collect_id": collectId,
    });
  }

  Stream<dynamic> liveGoodsDetails(String goodsId) {
    return post2("$_baseUrl/api/Goods/detail",
        params: {"goods_id": goodsId, "user_id": userId, "login_token": token});
  }

  Stream<dynamic> checkCouldAfterSale(String orderGoodsId) {
    return post2("$_baseUrl/api/user.refund/isApply", params: {
      "user_id": userId,
      "login_token": token,
      "order_goods_id": orderGoodsId
    });
  }

  Stream<dynamic> refundReason() {
    return get("$_baseUrl/api/user.refund/getRefundReason",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> refundApply(String orderGoodsId, bool show, String reason,
      double refundPrice, List<File> images, String remark) {
    var params = {
      "user_id": userId,
      "login_token": token,
      "order_goods_id": orderGoodsId,
      "type": show ? 10 : 20,
      "reason": reason,
      "refund_price": refundPrice,
      "refund_desc": "$remark",
      "user_mobile": "$mobile",
      "is_need_send": show ? 10 : 20
    };

    params["apply"] = List.generate(images.length,
        (index) => MultipartFile.fromFileSync(images[index].absolute.path));

    return formData(
        "$_baseUrl/api/user.refund/apply", FormData.fromMap(params));
  }

  Stream<dynamic> refundList(String type) {
    return post2("$_baseUrl/api/user.refund/lists",
        params: {"user_id": userId, "login_token": token, "type": type});
  }

  Stream<dynamic> writeOffList(int page) {
    return post2("$_baseUrl/api/shop.order/getWriteOffList",
        params: {"page": page, "user_id": userId, "login_token": token});
  }

  Stream<dynamic> shopBalance() {
    return post("$_baseUrl/api/shop/getShopBalance",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> sendChangePhoneAuthCode(String newPhone) {
    return post2("$_baseUrl/api/user/sendSms", params: {
      "user_id": userId,
      "login_token": token,
      "mobile_number": newPhone,
      "sign": "change_mobile"
    });
  }

  Stream<dynamic> changePhone(String newPhone, String code) {
    return post2("$_baseUrl/api/user/changeUserPhone", params: {
      "user_id": userId,
      "login_token": token,
      "mobile_number": newPhone,
      "verify_code": code
    });
  }

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
      "login_token": token,
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
      "login_token": token,
      "pay_type": payPrefix,
    });
  }

  Stream<dynamic> footprint(int page) {
    return post2("$_baseUrl/api/Visit/getVisitList",
        params: {"user_id": userId, "login_token": token, "page": page});
  }

  Stream<dynamic> addCart(String goodsId, int num, String skuId) {
    return post2("$_baseUrl/api/Cart/add", params: {
      "goods_id": goodsId,
      "goods_sku_id": skuId,
      "goods_num": num,
      "user_id": userId,
      "login_token": token
    });
  }

  Stream<dynamic> deleteFootPoint(String visitId) {
    return get("$_baseUrl/api/Visit/deleteVisit", params: {
      "user_id": userId,
      "login_token": token,
      "visit_ids[]": "$visitId"
    });
  }

  Stream<dynamic> defaultAddress() {
    return post2("$_baseUrl/api/User/defaultAddress",
        params: {"user_id": userId, "login_token": token});
  }

  Stream<dynamic> buyNow(
      GoodsListBean goods, String addressId, String remark, int payType) {
    return post2("$_baseUrl/api/order/BuyNow", params: {
      "user_id": userId,
      "login_token": token,
      "goods_id": goods.goodsId,
      "goods_num": goods.totalNum,
      "goods_sku_id": goods.goodsSkuId,
      "pay_type": payType,
      "goods_type": "1",
      "goods_money":
          (goods.totalNum.integer * goods.goodsPrice.d).toStringAsFixed(2),
      "address_id": addressId,
      "remark": remark,
    });
  }

  Stream<dynamic> buyCart(List<String> carts, double price, String addressId,
      String remark, int payType) {
    return post2("$_baseUrl/api/order/cart", params: {
      "user_id": userId,
      "login_token": token,
      "cart_ids": carts.join(","),
      "pay_type": payType,
      "goods_type": "1",
      "goods_money": price.toStringAsFixed(2),
      "address_id": addressId,
      "remark": remark,
    });
  }

  Stream<dynamic> refundDetails(String id) {
    return post2("$_baseUrl/api/user.refund/detail", params: {
      "user_id": userId,
      "login_token": token,
      "order_refund_id": id
    });
  }

  Stream<dynamic> commitDelivery(String expressId, String expressName,
      String expressNo, String phone, String orderRefundId) {
    return post2("$_baseUrl/api/user.refund/delivery", params: {
      "user_id": userId,
      "login_token": token,
      "order_refund_id": orderRefundId,
      "user_mobile": phone,
      "express_id": expressId,
      "express_name": expressName,
      "express_no": expressNo
    });
  }

  Stream<dynamic> companyList() {
    return post2("$_baseUrl/api/user.refund/getCompanyList", params: {
      "user_id": userId,
      "login_token": token,
    });
  }

  Stream<dynamic> expressLine(String orderId, String orderGoodsId) {
    return post2("http://shop.tule-live.com/index.php/api/user.order/express",
        params: {
          "order_id": orderId,
          "order_goods_id": orderGoodsId,
          "user_id": userId,
          "login_token": token
        });
  }

  Stream<dynamic> receipt(String orderId) {
    return post2("$_baseUrl/api/user.order/receipt",
        params: {"order_id": orderId, "user_id": userId, "login_token": token});
  }

  Stream<dynamic> saveComment(List<File> images, String orderId, String goodsId,
      String content, double star, bool anonymous) {
    var params = {
      "is_anonymous": anonymous ? 1 : 0,
      "user_id": userId,
      "login_token": token,
      "order_id": orderId,
      "goods_id": goodsId,
      "star": star.toInt(),
      "content": content ?? ""
    };

    if (images.isNotEmpty)
      params["comment"] = List.generate(
          images.length,
          (index) => MultipartFile.fromFileSync(images[index].absolute.path,
              filename: "file$index"));
    printUrlWithArgs("$_baseUrl/api/user.comment/saveComment", params);
    return formData(
        "$_baseUrl/api/user.comment/saveComment", FormData.fromMap(params));
  }

  Stream<dynamic> bankList() {
    return post2("$_baseUrl/api/user.bankcard/getBankcardList",
        params: {"user_id": userId});
  }

  Stream<dynamic> withdrawRecord(int page) {
    return post2("$_baseUrl/api/user.Withdraw/getWithdrawList",
        params: {"user_id": userId, "page": page});
  }

  Stream<dynamic> deleteBankCard(String bankcardId) {
    return post2("$_baseUrl/api/user.bankcard/delBankcard",
        params: {"user_id": userId, "bankcard_id": bankcardId});
  }

  Stream<dynamic> applyWithdraw(
      String money, String payType, String bankcardId) {
    return post2("$_baseUrl/api/user.Withdraw/getWithdrawList", params: {
      "user_id": userId,
      "bankcard_id": bankcardId,
      "money": money,
      "pay_type": payType,
    });
  }

  Stream<dynamic> changeCollection(String goodsId, bool collect) {
    return post2("$_baseUrl/api/Goods/dealCollection", params: {
      "user_id": userId,
      "login_token": token,
      "goods_id": goodsId,
      "collection_type": collect ? 2 : 1,
    });
  }

  Stream<dynamic> addBankCard(String bankName, String bankCard,
      String bankAccount, String holder, String phone) {
    return post2("$_baseUrl/api/user.bankcard/saveBankcard", params: {
      "user_id": userId,
      "bank_name": bankName,
      "bank_card": bankCard,
      "bank_account": bankAccount,
      "holder": holder,
      "telephone": phone,
    });
  }

  Stream<dynamic> loadScanInfo(String code) {
    return get(code);
  }

  Stream<dynamic> writeOff(String orderId) {
    return post2("$_baseUrl/api/shop.order/extract", params: {
      "order_id": orderId,
      "user_id": userId,
      "token": token,
    });
  }
  Stream<dynamic> loadEvaluationList(String goodsId,String type,int page) {
    return post2("$_baseUrl/api/Comment/getCommentlists", params: {
      "user_id": userId,
      "login_token": token,
      "goods_id": goodsId,
      "comment_type": type,
      "page":page,
    });
  }

}

Api api = Api();
