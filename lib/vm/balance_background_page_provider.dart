import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class BalanceBackgroundPageProvider extends BaseProvider with LoadMoreMixin {
  List<WriteOffData> _lists = [];

  List<WriteOffData> get lists => _lists;

  String _balance = "0";

  String get balance => _balance;

  set balance(String b) {
    _balance = b;
    notifyListeners();
  }

  set lists(List<WriteOffData> ll) {
    _lists.addAll(ll);
    notifyListeners();
  }

  void loadBalance() {
    api.shopBalance().listen((event) {
      var resp = ShopBalanceResp.fromJson(event);
      if (resp.code == 1) {
        balance = resp.data.shopBalance;
      }
    });
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.writeOffList(page).listen((event) {
      var resp = WriteOffResp.fromJson(event);
      canload = resp.code == 1 && resp.data.length > 0;
      if (resp.code == 1) {
        if (clearData) {
          lists.clear();
        }
        lists = resp.data;
      }
    });
  }

  void loadList({bool clearData = false}) {
    loadMore(clearData: clearData);
  }
}
