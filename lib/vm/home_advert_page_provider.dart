import 'package:worldfunclub/bean/active_bean.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class HomeAdvertPageProvider extends BaseProvider {
  final String _id;
  final String _sign;
  final String name;

  HomeAdvertPageProvider(this._id, this._sign, this.name);

  List<ActiveGoods> _goods = [];

  List<ActiveGoods> get goods => _goods;

  set goods(List<ActiveGoods> data) {
    _goods = data;
    notifyListeners();
  }

  void loadList() {
    api.loadActiveGoods(_sign, _id, 1).listen((event) {
      var bean = ActiveGoodsList.fromJson(event);
      if (bean.code == 1) {
        goods = bean.data;
      }
    });
  }
}
