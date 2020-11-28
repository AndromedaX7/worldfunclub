import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class HomeMainPageProvider extends BaseProvider {


  void  category(void Function (List<HomeCategoryData> list) count)   {
      api.homeCategory() .listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.category_type != "1");
        var home = HomeCategoryData();
        home.isHome=true;
        home.name="首页";
        List<HomeCategoryData> temp =[];
        temp.add(home);
        temp.addAll(data);

        count( temp );
      }else{
        count([]);
      }
    });
  }

  List<Widget> _tabView = List();

  List<Widget> get tabView => _tabView;
}
