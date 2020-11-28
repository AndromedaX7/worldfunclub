import 'package:worldfunclub/http/http.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/other.dart';

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

  Stream<dynamic> orderList(int page, OrderType orderType,GoodsType goodsType) {
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
}

Api api = Api();
