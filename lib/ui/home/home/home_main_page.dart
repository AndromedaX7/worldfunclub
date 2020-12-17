import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_category_page.dart';
import 'package:worldfunclub/ui/goods/goods_search_delegate.dart';
import 'package:worldfunclub/ui/home/home/home_category_home_page.dart';
import 'package:worldfunclub/ui/home/home/home_category_other_page.dart';
import 'package:worldfunclub/ui/home/message_center_page.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/widgets/search_bar.dart';

class HomeMainPage extends ProviderWidget<HomeMainPageProvider> {
  HomeMainPage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
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

  List<HomeCategoryData> _data = [];

  List<HomeCategoryData> get data => _data;

  set data(List<HomeCategoryData> tabs) {

      this._data.clear();
      this._data.addAll(tabs);
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length:  data.length,
        initialIndex: currentPos,
        vsync: this);
    controller.addListener(() {
      currentPos = controller.index;
    });
    widget.provider.category((i) {
     setState(() {
       data = i;
       controller = TabController(
           initialIndex: currentPos, length: data.length, vsync: this);
     });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          tabs:  data
              .map((e) => Tab(
                    text: e.name,
                  ))
              .toList(),
        ),
        title: SearchBar(() {
          showSearch(context: context,delegate:GoodsSearchDelegate(type: GoodsType.self),);
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (c) => SearchPage(GoodsType.self)));
        }),
        actions: [
          InkWell(
            child: Image.asset("images/ic_category.webp"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => GoodsCategoryPage())),
          )
        ],
        leading: InkWell(
          onTap: messageCenter,
          child: Image.asset("images/ic_message.webp"),
        ),
      ),
      body:data.isEmpty?Center(
        child: CircularProgressIndicator(),
      ): TabBarView(
        controller: controller,
        children:  data.map((e) {
          if (e.isHome) {
            return (Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                color: Color(0xfff5f5f5),
                child: HomeCategoryHomePage()));
          } else {
            return (Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                color: Color(0xfff5f5f5),
                child: HomeCategoryOtherPage(e)));
          }
        }).toList(),
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
