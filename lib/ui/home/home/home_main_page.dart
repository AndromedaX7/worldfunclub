import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/home/home/search_delegate.dart';
import 'package:worldfunclub/providers.dart';
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

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: widget.provider.tabCount, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.provider.category(),
        builder: (c, i) {
          switch (i.connectionState) {
            case ConnectionState.done:
              var resp = HomeCategory.fromJson(i.data);
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
                controller = TabController(
                    length: widget.provider.tabCount, vsync: this);
              }
              return Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    controller: controller,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: widget.provider.tabItem,
                  ),
                  title: SearchBar(() {
                    showSearch(
                        context: context, delegate: SearchBarViewDelegate());
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
                body: TabBarView(
                  controller: controller,
                  children: widget.provider.tabView,
                ),
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }

  void messageCenter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => MessageCenterPage()));
  }
}
