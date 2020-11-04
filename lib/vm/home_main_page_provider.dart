import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/utils/log.dart';

class HomeMainPageProvider extends BaseProvider {
  int _tabCount = 0;

  int get tabCount => _tabCount;

  set tabCount(int count) {
    _tabCount = count;
    notifyListeners();
  }

  List<String> _tabsName = List();

  List<String> get tabsName => _tabsName;

  set tabsName(List<String> tabs) {
    this._tabsName.clear();
    this._tabsName.addAll(tabs);
    notifyListeners();
  }

  List<HomeCategoryData> _data = List();


  List<HomeCategoryData> get data => _data;

  set data(List<HomeCategoryData> tabs) {
    this._data.clear();
    this._data.addAll(tabs);
    notifyListeners();
  }

  void category() {
    api.homeCategory().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.category_type != "1");

        List<String> tabsName = List();
        tabsName.add("首页");
        this.data=data;
        for (var d in data) {
          tabsName.add(d.name);
        }
        this.tabsName = tabsName;
        tabCount = tabsName.length;
        Log.e("tabCount:$tabCount");
      }
    });
  }
}
