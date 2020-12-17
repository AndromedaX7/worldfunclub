import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/utils/log.dart';

class GoodsCategoryPageProvider extends BaseProvider {
  int _selectPosition = 0;

  int get selectPosition => _selectPosition;

  set selectPosition(int pos) {
    _selectPosition = pos;
    getCategoryInfo(pos);
    notifyListeners();
  }

  List<BannerData> _bannerData = [];

  List<BannerData> get bannerData => _bannerData;

  set bannerData(List<BannerData> b) {
    _bannerData = b;
    notifyListeners();
  }

  void getCategoryInfo(int pos) {
    subCategoryData = categoryData[pos].child;
    loadBanner(categoryData[pos].categoryId);
  }

  List<HomeCategoryData> _categoryData = [];

  List<HomeCategoryData> get categoryData => _categoryData;

  set categoryData(List<HomeCategoryData> data) {
    _categoryData = data;
    notifyListeners();
  }

  List<HomeCategoryData> _subCategoryData = [];

  List<HomeCategoryData> get subCategoryData => _subCategoryData;

  set subCategoryData(List<HomeCategoryData> data) {
    _subCategoryData = data;
    notifyListeners();
  }


  void loadCategoryData() {
    api.homeCategory().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.categoryType != "1");
        Log.d(data.length);
        categoryData = data;
        subCategoryData = categoryData[selectPosition].child;
        loadBanner(categoryData[selectPosition].categoryId);
      }
    });
  }

  void loadBanner(String categoryId) {
    api.banner(categoryId, "1").listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        bannerData = bannerBean.data ;
      }
    });
  }
}
