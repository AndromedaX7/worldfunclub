import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/search.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class GoodsSearchPageProvider extends BaseProvider with LoadMoreMixin {
   String  query;
   GoodsType  type;

  GoodsSearchPageProvider(this. query, this. type);

  void queryGoods({bool clear = false}) {
    loadMore(clearData: clear);
  }

  List<HomeCategoryGoods> _data = [];

  List<HomeCategoryGoods> get data => _data;

  set data(List<HomeCategoryGoods> d) {
    _data.addAll(d);
    notifyListeners();
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.searchGoods( type, query, page).listen((event) {
      var bean = GoodsSearchList.fromJson(event);
      canload = bean.code == 1;
      if (bean.code == 1) {
        if (clearData) {
          data.clear();
        }
        data = bean.data;
      }
    });
  }


  void search(String query,GoodsType type){
    this.query =query;
    this.type=type;
    page=0;
    loadMore(clearData: true);
  }
}
