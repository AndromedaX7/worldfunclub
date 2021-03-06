import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class CartPageProvider extends BaseProvider  {
  List<GoodsListBean> _cartList = [];

  List<GoodsListBean> get cartList => _cartList;

  bool checkAll = false;

  bool isEdit = false;

  int checkCount = 0;

  String checkAllPrice = "0.00";

  set cartList(List<GoodsListBean> cart) {
    this._cartList = cart;
    notifyListeners();
  }

  void carts() {

    request(api.cartList(), (json) {
      var bean = CartBean.fromJson(json);
      if (bean.code == 1) {
        cartList = bean.data.goodsList;
      }
    });
  }

  void increaseCartNum(
      bool orientation, GoodsListBean data, void Function(bool) refresh) {
    var code = (orientation) ? "1" : "2";

    int num = data.totalNum.integer;
    if (orientation) {
      if (data.totalNum.integer >= data.stockNum.integer) {
        return;
      } else {
        data.totalNum = "${num + 1}";
      }
    } else {
      if (data.totalNum.integer <= 1) {
        return;
      } else {
        data.totalNum = "${num - 1}";
      }
    }

    api.increaseCartNum(code, data.cartId).listen((event) {
      refresh(EmptyDataResp.fromJson(event).code == 1);
    });
  }

  void deleteCarts() {
    List<String> selectedCarts = [];
    cartList.forEach((GoodsListBean e) {
      if (e.selected) {
        selectedCarts.add(e.cartId);
      }
    });
    api.delCart(selectedCarts).listen((event) {
      if (EmptyDataResp.fromJson(event).code == 1) {
        cartList.removeWhere((element) => element.selected);
        notifyListeners();
      }
    });
  }

  void buySelected() {}
}
