import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/my_collection_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class MyCollectionPage extends ProviderWidget<MyCollectionPageProvider> {
  MyCollectionPage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _MyCollectionPageContent(mProvider);
  }
}

class _MyCollectionPageContent extends StatefulWidget {
  final MyCollectionPageProvider provider;

  _MyCollectionPageContent(this.provider);

  @override
  _MyCollectionPageContentState createState() =>
      _MyCollectionPageContentState();
}

class _MyCollectionPageContentState extends State<_MyCollectionPageContent> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey();

  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller=ScrollController();
    widget.provider.collectionList(clearData: true);
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
       if(widget.provider.canload){
         widget.provider.collectionList();
       }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: ListWrapper(
        data: widget.provider.collection,
        child: ListView.builder(controller: _controller,
          itemCount: widget.provider.collection.length,
          itemBuilder: (c, i) => buildItem(widget.provider.collection[i]),
        ),
      ),
    );
  }

  Widget buildItem(CollectionData data) {
    return Dismissible(
      key: Key(data.collectId),
      background: Container(
        margin: EdgeInsets.symmetric(vertical: 4.w),
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
            )),
      ),
      child: Container(
        height: 138.w,
        margin: EdgeInsets.symmetric(vertical: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.w),
        color: Colors.white,
        child: Row(
          children: [
            Image.network(
              data.goodsImage,
              width: 110.w,
              height: 110.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.goodsName}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text.rich(
                    TextSpan(
                      text: "￥",
                      style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: "${data.goodsPrice}",
                          style: TextStyle(color: Colors.red, fontSize: 22.sp),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "热销${data.goodsSales}件",
                    style: TextStyle(color: Colors.black12, fontSize: 12.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
          ScaffoldMessenger.of(context).showSnackBar(
         // scaffold.currentState.showSnackBar(
          SnackBar(
            content: Text("确认取消收藏?"),
            action: SnackBarAction(
              textColor: Colors.red,
              label: "取消收藏",
              onPressed: () {
                setState(() {
                  widget.provider.deleteCollection(data);
                });
              },
            ),
          ),
        );
        return false;
      },
      onDismissed: (d) {},
    );
  }
}
