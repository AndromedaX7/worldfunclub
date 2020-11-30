import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';

class OrderDetailsPageProvider extends BaseProvider {
  final OrderData data;
  final GoodsType type;

  OrderDetailsPageProvider(this.data, this.type);

  OrderDetailsData _orderRemote=OrderDetailsData();

  OrderDetailsData get orderRemote => _orderRemote;

  set orderRemote(OrderDetailsData input) {
    this._orderRemote = input;
    notifyListeners();
  }

  void orderDetails() {
    api.orderDetails(data.order_id).listen((event) {
      var resp = OrderDetailsResp.fromJson(event);
      if (resp.code == 1) {
        orderRemote = resp.data;
      }
    });
  }
}
