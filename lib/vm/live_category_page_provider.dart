import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class LiveCategoryPageProvider extends BaseProvider with LoadMoreMixin {
  final HomeCategoryData _data;

  LiveCategoryPageProvider(this._data);

  List<BannerData> _bannerList = List();
  List<HomeCategoryGoods> _goods = List();

  List<BannerData> get bannerList => _bannerList;

  List<HomeCategoryGoods> get goods => _goods;

  set bannerList(List<BannerData> banner) {
    _bannerList = banner;
    notifyListeners();
  }

  set goods(List<HomeCategoryGoods> goods) {
    _goods.addAll(goods);
    notifyListeners();
  }

  void categoryGoods() {
    api.banner(_data.category_id, "1").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerList = (bannerBean.data);
      }
    });
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.categoryGoods(_data.category_id, false, "1", page).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      canload = bean.code == 1;
      if (bean.code == 1) {
        if (clearData) {
          goods.clear();
        }
        goods = (bean.data);
      }
    });
  }

  void loadGoodsWithPager({bool clearData = false}) {
    loadMore(clearData: clearData);
  }
}
