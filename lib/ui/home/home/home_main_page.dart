import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/home/home/home_category_home_page.dart';
import 'package:worldfunclub/home/home/home_category_other_page.dart';
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

class _HomeMainPageContentState extends State<_HomeMainPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.category();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: widget.provider.tabCount,
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
          index: widget.provider.tabCount > 0 ? 1 : 0,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
            if (widget.provider.tabCount > 0)
              TabBarView(
                children: genTabView(),
              ),
          ],
        ),
      ),
    );
  }

  void messageCenter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => MessageCenterPage()));
  }

  Widget tabBar() {
    if (widget.provider.tabCount > 0) {
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
    for (String i in widget.provider.tabsName) {
      tabs.add(Tab(
        text: i,
      ));
    }
    return tabs;
  }

  List<Widget> genTabView() {
    List<Widget> tabs = List();
    for (int i = 0; i < widget.provider.tabsName.length; i++) {
      if (i == 0) {
        tabs.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            color: Color(0xfff5f5f5),
            child: HomeCategoryHomePage()));
      } else {
        tabs.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            color: Color(0xfff5f5f5),
            child: HomeCategoryOtherPage(widget.provider.data[i - 1])));
      }
    }
    return tabs;
  }
}

//
// class _HomeMainPageState extends State<HomeMainPage>
//     with SingleTickerProviderStateMixin {
//   int tabs = 0;
//   int indexes = 0;
//   List<String> tabsName = List();
//   List<HomeCategoryData> data = List();
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//   }
//

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// }
//
