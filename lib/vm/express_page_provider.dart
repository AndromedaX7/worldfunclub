import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class ExpressPageProvider extends BaseProvider {
  final String orderId;
  final String orderGoodsId;

  ExpressPageProvider(this.orderId, this.orderGoodsId);

  String _deliveryNo = "";
  String _deliveryName = "";
  List<ExpressDeliveryList> _deliveryList = [];
  String _goodsImage = "";

  String get deliveryNo => _deliveryNo;

  String get deliveryName => _deliveryName;

  List<ExpressDeliveryList> get deliveryList => _deliveryList;

  String get goodsImage => _goodsImage;

  set deliveryNo(String string) {
    _deliveryNo = string;
    notifyListeners();
  }

  set deliveryName(String string) {
    _deliveryName = string;
    notifyListeners();
  }

  set goodsImage(String string) {
    _goodsImage = string;
    notifyListeners();
  }

  set deliveryList(List<ExpressDeliveryList> ll) {
    _deliveryList = ll;
    notifyListeners();
  }

  void loadExpressLine() {
    api.expressLine(orderId, orderGoodsId).listen((event) {
      var resp = ExpressLineResp.fromJson(event);
      if (resp.code == 1) {
        goodsImage = resp.data.goodsImage;
        deliveryList = resp.data.deliveryList;
        deliveryNo = resp.data.deliveryNo;
        deliveryName = resp.data.deliveryName;
      }
    });
  }
}
