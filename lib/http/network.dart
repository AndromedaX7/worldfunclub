import 'package:flutter/foundation.dart';
import 'package:worldfunclub/http/http.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';

class Api {

  Api(){
    if(kIsWeb){
      _baseUrl="http://192.168.10.6/index.php";
    }else{
      _baseUrl="http://shop.tule-live.com/index.php";
    }
  }
  String _baseUrl = "";

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


  Stream <dynamic> getCollectList(int page){
    return post2("$_baseUrl/api/Collection/getCollectionList",params: {
      "user_id": userId,
      "login_token": loginToken,
      "page": page });
  }
  
  Stream <dynamic> deleteCollection(String collectId){
    return post2("$_baseUrl/api/Collection/deleteCollection",params: {
    "user_id": userId,
    "login_token": loginToken,
    "collect_id": collectId,
    });
  }

  Stream<dynamic> liveGoodsDetails(String goodsId){
    return post2("$_baseUrl/api/Goods/detail",params: {
      "goods_id":goodsId,
      "user_id":userId,
      "login_token":loginToken
    });

    // override suspend fun goodsDetailsLive(
    //         user_id: String,
    //         login_token: String,
    //         id: String,
    //         discount_id: String
    //     ): GoodsDetailsResp3 {
    //         val param = RxHttp.postForm()
    //             .add("goods_id", id)
    //             .add("user_id", user_id)
    //             .add("login_token", login_token)
    //         if (!TextUtils.isEmpty(discount_id)) {
    //             param.add("discount_id", discount_id)
    //         }
    //         return param.toClass<GoodsDetailsResp3>()
    //             .await()
    //     }
  }
}

Api api = Api();
