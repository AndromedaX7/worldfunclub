import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/home/home/home_category_home_page.dart';
import 'package:worldfunclub/ui/home/home/home_category_other_page.dart';
import 'package:worldfunclub/utils/log.dart';
import 'file:///D:/dev/workspaces2/worldfunclub/lib/local_platform_channel.dart';

class HomeMainPageProvider extends BaseProvider {
  int _tabCount = 0;

  int get tabCount => _tabCount;

  set tabCount(int count) {
    _tabCount = count;
    Log.v("count is $count");
    // notifyListeners();
  }

  List<String> _tabsName = List();

  List<String> get tabsName => _tabsName;

  set tabsName(List<String> tabs) {
    this._tabsName.clear();
    this._tabsName.addAll(tabs);
    // notifyListeners();
  }

  List<HomeCategoryData> _data = List();

  List<HomeCategoryData> get data => _data;

  set data(List<HomeCategoryData> tabs) {
    this._data.clear();
    this._data.addAll(tabs);
    // notifyListeners();
  }

  Stream<dynamic> category() {
    return api.homeCategory();
  }

  List<Widget> _tabView = List();
  List<Widget> _tabItem = List();

  List<Widget> get tabView => _tabView;

  List<Widget> get tabItem => _tabItem;

  setTabs(int count) {
    _tabView = genTabView();
    _tabItem = genTabs();
    tabCount = count;
    // notifyListeners();
  }

  List<Widget> genTabs() {
    List<Widget> tabs = List();
    for (String i in tabsName) {
      tabs.add(Tab(
        text: i,
      ));
    }
    return tabs;
  }

  List<Widget> genTabView() {
    List<Widget> tabs = List();
    for (int i = 0; i < tabsName.length; i++) {
      if (i == 0) {
        tabs.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            color: Color(0xfff5f5f5),
            child: HomeCategoryHomePage()));
      } else {
        tabs.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            color: Color(0xfff5f5f5),
            child: HomeCategoryOtherPage(data[i - 1])));
      }
    }
    return tabs;
  }

  void startRoute(){
    LocalChannel.startRouteActivity(goodsCategory, {});
  }
}
