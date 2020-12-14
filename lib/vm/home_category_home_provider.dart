import 'package:worldfunclub/bean/active_bean.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class HomeCategoryHomePageProvider extends BaseProvider with LoadMoreMixin {
  List<BannerData> _bannerTop = [];
  List<BannerData> _bannerContent = [];
  List<HomeCategoryGoods> _goods = [];
  List<HomeCategoryGoods> _goods2 = [];

  List<HomeCategoryGoods> get goods => _goods;

  List<HomeCategoryGoods> get goods2 => _goods2;

  set goods2(List<HomeCategoryGoods> goods) {
    _goods2.addAll(goods);
    notifyListeners();
  }

  List<ActiveItem> _category = [];

  List<ActiveItem> get category => _category;

  set category(List<ActiveItem> data) {
    _category = data;
    notifyListeners();
  }

  set goods(List<HomeCategoryGoods> goods) {
    _goods = goods;
    notifyListeners();
  }

  List<BannerData> get bannerTop => _bannerTop;

  set bannerTop(List<BannerData> data) {
    this._bannerTop = data;
    notifyListeners();
  }

  List<BannerData> get bannerContent => _bannerContent;

  set bannerContent(List<BannerData> data) {
    this._bannerContent = data;
    notifyListeners();
  }

  void banner() {
    api.banner("99999", "1").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerTop = bannerBean.data;
      }
    });
    api.banner("99999", "2").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerContent = bannerBean.data;
      }
    });
    api.categoryGoods("99999", true, "2", 1).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      if (bean.code == 1) {
        goods = (bean.data);
      }
    });

    api.loadActiveList().listen((event) {
      var bean = ActiveList.fromJson(event);
      if (bean.code == 1) {
        category = bean.data;
      }
    });
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.categoryGoods("99999", true, "1", page).listen((event) {
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

  @override
  void dispose() {
    bannerContent = [];
    bannerTop = [];
    super.dispose();
    Log.e("dispose");
  }
}
