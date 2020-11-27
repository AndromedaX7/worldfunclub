import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_category_page.dart';
import 'package:worldfunclub/ui/goods/goods_search_delegate.dart';
import 'package:worldfunclub/ui/home/message_center_page.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/widgets/search_bar.dart';

class HomeMainPage extends ProviderWidget<HomeMainPageProvider> {
  HomeMainPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _HomeMainPageContent(mProvider);
  }
}

class _HomeMainPageContent extends StatefulWidget {
  final HomeMainPageProvider provider;

  _HomeMainPageContent(this.provider);

  @override
  _HomeMainPageContentState createState() => _HomeMainPageContentState();
}

class _HomeMainPageContentState extends State<_HomeMainPageContent>
    with TickerProviderStateMixin {
  TabController controller;
  int currentPos = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: widget.provider.tabCount,
        initialIndex: currentPos,
        vsync: this);
    controller.addListener(() {
      currentPos = controller.index;
    });
    widget.provider.category().listen((event) {
      var resp = HomeCategory.fromJson(event);
      if (resp.code == 1) {
        var data = resp.data;
        data.removeWhere((element) => element.category_type != "1");
        List<String> tabsName = List();
        tabsName.add("首页");
        widget.provider.data = data;
        for (var d in data) {
          tabsName.add(d.name);
        }
        widget.provider.tabsName = tabsName;
        widget.provider.setTabs(tabsName.length);
        setState(() {
          controller = TabController(
              initialIndex: currentPos,
              length: widget.provider.tabCount,
              vsync: this);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //     stream: widget.provider.category(),
    //     builder: (c, i) {
    //       switch (i.connectionState) {
    //         case ConnectionState.done:
    //           var resp = HomeCategory.fromJson(i.data);
    //           if (resp.code == 1) {
    //             var data = resp.data;
    //             data.removeWhere((element) => element.category_type != "1");
    //             List<String> tabsName = List();
    //             tabsName.add("首页");
    //             widget.provider.data = data;
    //             for (var d in data) {
    //               tabsName.add(d.name);
    //             }
    //             widget.provider.tabsName = tabsName;
    //             widget.provider.setTabs(tabsName.length);
    //             controller = TabController(initialIndex: currentPos,
    //                 length: widget.provider.tabCount, vsync: this);
    //           }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        bottom: TabBar(
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          controller: controller,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: widget.provider.tabItem,
        ),
        title: SearchBar(() {
          showSearch(context: context, delegate: GoodsSearchDelegate());
        }),
        actions: [
          InkWell(
            child: Image.asset("images/ic_category.webp"),
            // onTap: () => widget.provider.startRoute(),、
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => GoodsCategoryPage())),
          )
        ],
        leading: InkWell(
          onTap: messageCenter,
          child: Image.asset("images/ic_message.webp"),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: widget.provider.tabView,
      ),
    );
    //     default:
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //   }
    // });
  }

  void messageCenter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => MessageCenterPage()));
  }
}
