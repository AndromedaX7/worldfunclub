import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';
class MinePageProvider extends BaseProvider with LoadMoreMixin{
  String _balance = "0.00";

  int  _collectCount=0;
  int get  collectCount=>_collectCount;

  set collectCount(int i ){
    _collectCount= i;
    notifyListeners();
  }

  String get balance => _balance;

  set balance(String bala) {
    _balance = bala;
    notifyListeners();
  }


  List<HomeCategoryGoods> _goods2 = [];

  List<HomeCategoryGoods> get goods2 => _goods2;

  set goods2(List<HomeCategoryGoods> goods) {
    _goods2.addAll(goods);
    notifyListeners();
  }

  void userBalances() {
    api.userBalance().listen((event) {
      var balance = MainBalance.fromJson(event);
      if (balance.code == 1) {
        this.balance = balance.data.balance;
        this.collectCount=balance.data.collectNum.integer;
      }
    });
  }



  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.recommendGoods(/*"99999", true, "1",*/ page).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      canload = bean.code == 1;
      if (bean.code == 1) {
        if (clearData) {
          goods2.clear();
        }
        goods2 = bean.data;
      }
    });
  }

  void loadGoodsWithPager({bool clearData = false}) {
    loadMore(clearData: clearData);
  }
}
