import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_search_delegate.dart';
import 'package:worldfunclub/vm/goods_category_last_page_provider.dart';
import 'package:worldfunclub/widgets/good_item.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';
import 'package:worldfunclub/widgets/search_bar.dart';


class GoodsCategoryLastPage extends StatefulWidget {
  final HomeCategoryData data;

  GoodsCategoryLastPage(this.data);

  @override
  _GoodsCategoryLastPageState createState() => _GoodsCategoryLastPageState();
}

class _GoodsCategoryLastPageState extends State<GoodsCategoryLastPage>
    with SingleTickerProviderStateMixin {
  int _pos = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.data.child.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (pos) {
              setState(() {
                _pos = pos;
              });
            },
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black54,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: List.generate(
                widget.data.child.length,
                (index) => Tab(
                      text: widget.data.child[index].name,
                    )),
          ),
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black54,
          ),
          brightness: Brightness.light,
          title: SearchBar(() {
            showSearch(context: context, delegate: GoodsSearchDelegate());
          }),
          actions: [
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Center(
                    child: Text(
                  "取消",
                  style: TextStyle(color: Colors.black54),
                )),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: TabBarView(
          children: List.generate(widget.data.child.length,
              (index) => GoodsCategoryListPage(widget.data.child[index])),
        ),
      ),
    );
  }
}

class GoodsCategoryListPage
    extends ProviderWidget<GoodsCategoryLastPageProvider> {
  GoodsCategoryListPage(HomeCategoryData data) : super(params: [data]);

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _GoodsCategoryListPageContent(mProvider);
  }
}

class _GoodsCategoryListPageContent extends StatefulWidget {
  final GoodsCategoryLastPageProvider provider;

  _GoodsCategoryListPageContent(this.provider);

  @override
  _GoodsCategoryListPageContentState createState() =>
      _GoodsCategoryListPageContentState();
}

class _GoodsCategoryListPageContentState
    extends State<_GoodsCategoryListPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    widget.provider.loadGoodsWithPager(clearData: true);
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.loadGoodsWithPager();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      padding: EdgeInsets.symmetric(horizontal: 10.5.w),
      child: ListWrapper(
        data:widget.provider.goods2 ,
        child: GridView.builder(
          controller: _controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 170 / 256),
          itemCount: widget.provider.goods2.length,
          itemBuilder: (c, i) => Container(
            margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 3.5.w),
            child: GoodsItemForSearch(widget.provider.goods2[i], GoodsType.self),
          ),
        ),
      ),
    );
  }
}
