import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/bean/cart_list.dart';

class CartPageProvider extends BaseProvider {

  List<GoodsListBean> _cartList = List();

  List<GoodsListBean> get cartList => _cartList;

  set cartList(List<GoodsListBean> cart) {
    this._cartList = cart;
    notifyListeners();
  }

  void carts() {
    api.cartList().listen((event) {
      var bean = CartBean.fromJson(event);
      if (bean.code == 1) {
        cartList = bean.data.goods_list;
      }
    });
  }

}