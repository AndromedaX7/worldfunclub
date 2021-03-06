import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_details_page.dart';
import 'package:worldfunclub/ui/goods/goods_live_details_page.dart';
import 'package:worldfunclub/vm/my_footprint_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyFootprintPage extends ProviderWidget<MyFootprintPageProvider> {
  MyFootprintPage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _MyFootprintPageContent(mProvider);
  }
}

class _MyFootprintPageContent extends StatefulWidget {
  final MyFootprintPageProvider provider;

  _MyFootprintPageContent(this.provider);

  @override
  _MyFootprintPageContentState createState() => _MyFootprintPageContentState();
}

class _MyFootprintPageContentState extends State<_MyFootprintPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    widget.provider.footprint(clearData: true);
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.footprint();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("我的足迹"),
      ),
      body: ListWrapper(
        data: widget.provider.data,
        child: ListView.builder(
          controller: _controller,
          itemCount: widget.provider.data.length,
          itemBuilder: (c, i) => _buildItem(widget.provider.data[i]),
        ),
      ),
    );
  }

  Widget _buildItem(FootprintData data) {
    return Container(
        margin: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${data.time}",
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 8.w,
            ),
            Column(
              children: List.generate(data.content.length,
                  (index) => _buildGoods(data, data.content[index])).toList(),
            ),
          ],
        ));
  }

  Widget _buildGoods(FootprintData data, FootprintContent content) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => content.goodsType == "1"
                    ? GoodsDetailsPage(content.goodsId)
                    : GoodsLiveDetailsPage(content.goodsId)));
      },
      child: Container(
        width: 355.w,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
        child: Dismissible(
          key: Key(content.visitId),
          background: Container(
            color: Colors.red,
            child: Container(
              padding: EdgeInsets.only(right: 24.w, left: 24.w),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 26.w,
                      ),
                      Text(
                        "删除",
                        style: TextStyle(fontSize: 14.w, color: Colors.white),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 26.w,
                      ),
                      Text(
                        "删除",
                        style: TextStyle(fontSize: 14.w, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onDismissed: (d) {
            setState(() {
              widget.provider.deleteFootPrint(content);
              widget.provider.data.forEach((element) {
                element.content.removeWhere((element) => element == content);
                if (element.content.isEmpty) {
                  setState(() {
                    widget.provider.data.removeWhere((it) => element == it);
                  });
                }
              });
            });
          },
          child: Container(
            height: 110.w,
            child: Row(
              children: [
                Image.network(
                  content.goodsImage,
                  width: 110.w,
                  height: 110.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${content.goodsName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 14.sp, color: Colors.black87),
                      ),
                      Container(
                        width: 215.w,
                        child: Row(
                          children: [
                            Text(
                              "￥${content.goodsPrice}",
                              style:
                                  TextStyle(fontSize: 16.sp, color: Colors.red),
                            ),
                            Spacer(),
                            Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/ic_cart_footprint.webp",
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              width: 14.w,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
