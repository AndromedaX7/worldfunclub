import 'package:flutter/material.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_search_delegate.dart';
import 'package:worldfunclub/ui/home/live/live_category_page.dart';
import 'package:worldfunclub/vm/live_page_provider.dart';
import 'package:worldfunclub/widgets/search_bar.dart';

class LivePage extends ProviderWidget<LivePageProvider> {
  LivePage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _LivePageContent(mProvider);
  }
}

class _LivePageContent extends StatefulWidget {
  final LivePageProvider provider;

  _LivePageContent(this.provider);

  @override
  _LivePageContentState createState() => _LivePageContentState();
}

class _LivePageContentState extends State<_LivePageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadCategory();
  }

  Widget tabBar() {
    if (widget.provider.indexes == 1) {
      return TabBar(
        indicatorColor: Colors.red,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black54,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: genTabs(),
      );
    } else {
      return null;
    }
  }

  List<Widget> genTabs() {
    List<Widget> tabs = [];
    for (String i in widget.provider.tabsName) {
      tabs.add(Tab(
        text: i,
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: widget.provider.tabs,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, brightness: Brightness.light,
          bottom: tabBar(),
          title: SearchBar(() {
            showSearch(
                context: context,
                delegate: GoodsSearchDelegate(type: GoodsType.live));
          }),
          // leading: IconButton(
          //   icon: Icon(Icons.messenger_outline),
          //   onPressed: messageCenter,
          // ),
        ),
        body: IndexedStack(
          index: widget.provider.indexes,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
            TabBarView(
              children: genTabView(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> genTabView() {
    List<Widget> tabs = [];
    for (int i = 0; i < widget.provider.tabsName.length; i++) {
      tabs.add(Container(
          color: Color(0xfff5f5f5),
          child: LiveCategoryPage(widget.provider.category[i])));
    }
    return tabs;
  }
}
