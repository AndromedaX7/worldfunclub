import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class LivePageProvider extends BaseProvider {
  int _indexes = 0;

  int get indexes => _indexes;

  set indexes(int idx) {
    _indexes = idx;
    notifyListeners();
  }

  List<String> _tabsName = List();

  List<String> get tabsName => _tabsName;

  set tabsName(List<String> tabs) {
    _tabsName = tabs;
    notifyListeners();
  }

  List<HomeCategoryData> _category = List();

  List<HomeCategoryData> get category => _category;

  set category(List<HomeCategoryData> cc) {
    this._category = cc;
    notifyListeners();
  }

  int _tabs = 0;

  int get tabs => _tabs;

  set tabs(int count) {
    _tabs = count;
    notifyListeners();
  }

  void loadCategory() {
    api.homeCategory().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.categoryType == "1");
        _tabsName.clear();
        category = data;
        for (var d in data) {
          _tabsName.add(d.name);
        }
        tabs = _tabsName.length;
        indexes = 1;
      }
    });
  }
}
