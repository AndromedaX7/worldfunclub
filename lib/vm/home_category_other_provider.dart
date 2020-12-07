import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class HomeCategoryOtherPageProvider extends BaseProvider with LoadMoreMixin {
  final HomeCategoryData _data;

  List<HomeCategoryData> _category = List();

  List<HomeCategoryData> get category => _category;

  set category(List<HomeCategoryData> cc) {
    this._category = cc;
  }

  HomeCategoryOtherPageProvider(this._data);

  List<BannerData> get bannerTop => _bannerTop;
  List<BannerData> _bannerTop = List();

  set bannerTop(List<BannerData> data) {
    this._bannerTop = data;
    notifyListeners();
  }

  List<BannerData> get bannerContent => _bannerContent;
  List<BannerData> _bannerContent = List();

  set bannerContent(List<BannerData> data) {
    this._bannerContent = data;
    notifyListeners();
  }

  List<HomeCategoryGoods> _goods = List();

  List<HomeCategoryGoods> get goods => _goods;

  set goods(List<HomeCategoryGoods> goods) {
    this._goods = goods;
    notifyListeners();
  }

  List<HomeCategoryGoods> _goods2 = List();

  List<HomeCategoryGoods> get goods2 => _goods2;

  set goods2(List<HomeCategoryGoods> goods) {
    this._goods2.addAll(goods) ;
    notifyListeners();
  }

  void banner() {
    category = _data.child;
    api.banner(_data.categoryId, "1").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerTop = (bannerBean.data);
      }
    });
    api.banner(_data.categoryId, "2").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerContent = (bannerBean.data);
      }
    });

    api.categoryGoods(_data.categoryId, true, "2", 1).listen((event) {
      var bean = HomeCategoryGoodsBean.fromJson(event);
      if (bean.code == 1) {
        goods = (bean.data);
      }
    });
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.categoryGoods(_data.categoryId, true, "1", page).listen((event) {
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
