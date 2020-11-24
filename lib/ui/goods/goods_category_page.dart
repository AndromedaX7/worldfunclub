import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/home/home/search_delegate.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/goods_category_page_provider.dart';
import 'package:worldfunclub/widgets/search_bar.dart';

class GoodsCategoryPage extends ProviderWidget<GoodsCategoryPageProvider> {
  GoodsCategoryPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _GoodsCategoryPageContent(mProvider);
  }
}

class _GoodsCategoryPageContent extends StatefulWidget {
  final GoodsCategoryPageProvider provider;

  _GoodsCategoryPageContent(this.provider);

  @override
  _GoodsCategoryPageContentState createState() =>
      _GoodsCategoryPageContentState();
}

class _GoodsCategoryPageContentState extends State<_GoodsCategoryPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
        ),
        brightness: Brightness.light,
        title: SearchBar(() {
          showSearch(context: context, delegate: SearchBarViewDelegate());
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
      body: Row(
        children: [
          Container(
            width: 100.w,
            height: double.infinity,
            child: ListView.builder(
              itemCount: widget.provider.categoryData.length,
              itemBuilder: (c, i) =>
                  _buildCategoryName(widget.provider.categoryData[i], i),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 14.w, right: 14.w, top: 30.w, bottom: 14.w),
                    height: 160.w,
                    child: Swiper(
                      itemCount: widget.provider.images.length,
                      autoplay: true,
                      loop: false,
                      itemBuilder: (bc, i) => Image.network(
                        widget.provider.images[i],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (bc, i) => _buildCategoryItem(
                          widget.provider.subCategoryData[i], i),
                      itemCount: widget.provider.subCategoryData.length,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem(HomeCategoryData data, int pos) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        width: 65.w,
        height: 65.w,
        child: Column(
          children: [
            Image.network(
              data.image.file_path,
              width: 50.w,
              height: 50.w,
            ),
            Text(
              "${data.name}",
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryName(HomeCategoryData data, int pos) {
    return GestureDetector(
      onTap: () {
        widget.provider.selectPosition = pos;
      },
      child: Container(
        color: Colors.white,
        height: 45.w,
        child: Row(
          children: [
            Container(
              width: 4.w,
              height: double.infinity,
              color: widget.provider.selectPosition == pos
                  ? Colors.red
                  : Colors.white,
            ),
            SizedBox(width: 8.w,),
            Text("${data.name}")
          ],
        ),
      ),
    );
  }
}
