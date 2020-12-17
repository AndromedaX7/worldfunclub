import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class AfterSaleListPageProvider extends BaseProvider {
  final String type;

  AfterSaleListPageProvider(this.type);

  List<RefundListData> _data=[];
  List<RefundListData> get data=>_data;
  set data(List<RefundListData> d){
    this._data=d;
    notifyListeners();
  }

  void load() {
    api.refundList(type).listen((event) {
      var resp = RefundListResp.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
      }
    });
  }
}
