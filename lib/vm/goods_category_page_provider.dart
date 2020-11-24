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

  void getCategoryInfo(int pos) {
    subCategoryData=categoryData[pos].child;
    images = [categoryData[pos].image.file_path];
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

  List<String> _images = [];

  List<String> get images => _images;

  set images(List<String> images) {
    _images = images;
    notifyListeners();
  }

  void loadCategoryData() {
    api.homeCategory().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.category_type != "1");
        Log.d(data.length);
        categoryData = data;
        subCategoryData=categoryData[selectPosition].child;
        images = [categoryData[selectPosition].image.file_path];
      }
    });
  }
}
