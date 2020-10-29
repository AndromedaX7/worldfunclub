import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/home/home/home_category_home_page.dart';
import 'package:worldfunclub/home/home/home_category_other_page.dart';
import 'package:worldfunclub/home/message_center_page.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/widgets/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'search_delegate.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage>
    with SingleTickerProviderStateMixin {
  int tabs = 0;
  int indexes = 0;
  List<String> tabsName = List();
  List<HomeCategoryData> data = List();

  @override
  void initState() {
    super.initState();
    Api().homeCategory().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.category_type !="1");

        tabsName.clear();
        tabsName.add("首页");
        this.data.addAll(data);
        for (var d in data) {
          tabsName..add(d.name);
        }
        setState(() {
          tabs = tabsName.length;
          indexes = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs,
      child: Scaffold(
          appBar: AppBar(
            bottom: tabBar(),
            title: SearchBar(() {
              showSearch(context: context, delegate: SearchBarViewDelegate());
            }),
            actions: [
              IconButton(
                icon: Icon(Icons.apps),
                onPressed: () {},
              )
            ],
            leading: IconButton(
              icon: Icon(Icons.messenger_outline),
              onPressed: messageCenter,
            ),
          ),
          body: IndexedStack(
            index: indexes,
            children: [
              Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              if (indexes == 1)
                TabBarView(
                  children: genTabView(),
                ),
            ],
          )),
    );
  }

  void messageCenter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => MessageCenterPage()));
  }

  Widget tabBar() {
    if (indexes == 1) {
      return TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: genTabs(),
      );
    } else {
      return null;
    }
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
        tabs.add(Container(padding: EdgeInsets.symmetric(horizontal: 14.w),color: Color(0xfff5f5f5),child:HomeCategoryHomePage()));
      } else {
        tabs.add(Container(padding: EdgeInsets.symmetric(horizontal: 14.w),color: Color(0xfff5f5f5), child: HomeCategoryOtherPage(data[i - 1])));
      }
    }

    return tabs;
  }
}
