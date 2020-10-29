import 'package:worldfunclub/http/http.dart';
import 'package:worldfunclub/main.dart';

class Api {
  String _baseUrl = "http://shop.tule-live.com/index.php";

  Stream<dynamic> homeCategory() {
    return post("$_baseUrl/api/Category/index");
  }

  Stream<dynamic> addressList() {
    return post("$_baseUrl/api/Address/lists",
        params: {"user_id": user_id, "login_token": login_token});
  }

  Stream<dynamic> editAddress(String addressId, String region, String name,
      String phone, String detail, bool isDefault) {
    return post2("$_baseUrl/api/Address/edit", params: {
      "address_id": addressId,
      "user_id": user_id,
      "login_token": login_token,
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
      "user_id": user_id,
      "login_token": login_token,
      "region": region,
      "name": name,
      "phone": phone,
      "detail": detail,
      "is_default": isDefault ? "2" : "1",
    });
  }

  Stream<dynamic> deleteAddress(String id) {
    return post2("$_baseUrl/api/Address/delete", params: {
      "user_id": user_id,
      "login_token": login_token,
      "address_id": id,
    });
  }

  //suspend fun banner(category_id: String, rotation_type: String): BannerData
  Stream<dynamic> banner(String categoryId, String rotationType) {
    return post2("$_baseUrl/api/Rotation/lists",
        params: {"category_id": categoryId, "rotation_type": rotationType});
  }

  //  override suspend fun categoryGoods(
  //         category_id: String,
  //         self: Boolean,
  //         page: Int
  //     ): CategoryGoods {
  //         return RxHttp.postForm("${baseUrl}/api/Goods/lists")
  //             .add("category_id", category_id)
  //             .add("goods_type", if (self) 1 else 2)
  //             .add("page", page)
  //             .toClass<CategoryGoods>()
  //             .await()
  //     }
  Stream<dynamic> categoryGoods(String category_id, bool self, int page) {
    return post2("$_baseUrl/api/Goods/lists", params: {
      "category_id": category_id,
      "goods_type": self ? 1 : 2,
      "page": page
    });
  }
}
