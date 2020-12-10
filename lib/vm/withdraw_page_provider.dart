import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class WithdrawPageProvider extends BaseProvider {
  int _selectCard = 0;

  int get selectCard => _selectCard;

  set selectCard(int idx) {
    _selectCard = idx;
    notifyListeners();
  }

  int _cardCount = 0;

  int get cardCount => _cardCount;

  set cardCount(int idx) {
    _cardCount = idx;
    notifyListeners();
  }

  List<BankListData> _data = [];

  List<BankListData> get data => _data;

  set data(List<BankListData> bl) {
    _data = bl;
    notifyListeners();
  }

  void loadList() {
    api.bankList().listen((event) {
      var resp = BankListResp.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
        cardCount = data.length;
      }
    });
  }

  void delete(BankListData card) {
    data.removeWhere((element) => card == element);
    if (data.length > 0) selectCard = 0;
    cardCount = data.length;
    api.deleteBankCard(card.bankcardId).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if (resp.code == 1) {
        Fluttertoast.showToast(msg: "删除成功");
      } else {
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }

  void withdraw(String withdraw) {
    if (data.isNotEmpty)
      api
          .applyWithdraw(withdraw, "30", data[selectCard].bankcardId)
          .listen((event) {
        var resp = EmptyDataResp.fromJson(event);
        if (resp.code == 1) {
          Fluttertoast.showToast(msg: "提现成功");
        } else {
          Fluttertoast.showToast(msg: resp.msg);
        }
      });
  }
}
