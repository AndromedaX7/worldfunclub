import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class PaySuccessPageProvider extends BaseProvider with LoadMoreMixin {
  final String orderId;
  final String orderType;
  final String pay;

  PaySuccessPageProvider(this.orderId, this.orderType, this.pay);

  List<HomeCategoryGoods> _goods2 = [];

  List<HomeCategoryGoods> get goods2 => _goods2;

  set goods2(List<HomeCategoryGoods> goods) {
    _goods2.addAll(goods);
    notifyListeners();
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
