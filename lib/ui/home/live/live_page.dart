import 'package:flutter/material.dart';
import 'package:worldfunclub/home/home/search_delegate.dart';
import 'file:///D:/dev/workspaces2/worldfunclub/lib/unused/live_category_page.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/home/live/live_category_page.dart';
import 'package:worldfunclub/vm/live_page_provider.dart';
import 'package:worldfunclub/widgets/search_bar.dart';

class LivePage extends ProviderWidget<LivePageProvider> {

  LivePage() : super();

  @override
  Widget buildContent(BuildContext context) {
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
    if ( widget.provider. indexes == 1) {
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
    for (String i in widget.provider. tabsName) {
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
      length:widget.provider. tabs,
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
    List<Widget> tabs = List();
    for (int i = 0; i < widget.provider.tabsName.length; i++) {
      tabs.add(Container(
          color: Color(0xfff5f5f5), child: LiveCategoryPage(widget.provider.category[i])));
    }
    return tabs;
  }
}