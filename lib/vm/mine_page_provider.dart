import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class MinePageProvider extends BaseProvider {
  String _balance = "0.00";

  String get balance => _balance;

  set balance(String bala) {
    _balance = bala;
    notifyListeners();
  }

  void userBalances() {
    api.userBalance().listen((event) {
      var balance = MainBalance.fromJson(event);
      if (balance.code == 1) {
        this.balance = balance.data.balance;
      }
    });
  }
}
