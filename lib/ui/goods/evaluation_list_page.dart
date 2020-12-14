import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/evaluation_list_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class EvaluationListPage extends ProviderWidget<EvaluationListPageProvider> {
  EvaluationListPage(String goodsId) : super(params: [goodsId]);

  @override
  Widget buildContent(
      BuildContext context, EvaluationListPageProvider provider) {
    return _EvaluationListPageContent(provider);
  }
}

class _EvaluationListPageContent extends StatefulWidget {
  final EvaluationListPageProvider provider;

  _EvaluationListPageContent(this.provider);

  @override
  _EvaluationListPageContentState createState() =>
      _EvaluationListPageContentState();
}

class _EvaluationListPageContentState
    extends State<_EvaluationListPageContent> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    widget.provider.loadEvaluation(clearData: true);
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (widget.provider.canload) {
          widget.provider.loadEvaluation();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("商品评价"),
        actions: [
          if (widget.provider.isLoading)
            Container(
              margin: EdgeInsets.only(right: 24.w),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            )
        ],
      ),
      body: Column(
        children: [
          Container(width: 375.w,
            color: Colors.white,
            child: Wrap(
              children: [
                InkWell(
                  onTap: () {
                    widget.provider.selected = 0;
                    widget.provider.loadEvaluation(clearData: true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 4.w),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: widget.provider.selected == 0
                            ? Colors.red
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text(
                      "全部评价(${widget.provider.all})",
                      style: TextStyle(
                          color: widget.provider.selected == 0
                              ? Colors.white
                              : Colors.red),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.provider.selected = 1;
                    widget.provider.loadEvaluation(clearData: true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 4.w),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: widget.provider.selected == 1
                            ? Colors.red
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text(
                      "有图(${widget.provider.picture})",
                      style: TextStyle(
                          color: widget.provider.selected == 1
                              ? Colors.white
                              : Colors.red),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.provider.selected = 2;
                    widget.provider.loadEvaluation(clearData: true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 4.w),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: widget.provider.selected == 2
                            ? Colors.red
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text(
                      "好评(${widget.provider.praise})",
                      style: TextStyle(
                          color: widget.provider.selected == 2
                              ? Colors.white
                              : Colors.red),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.provider.selected = 3;
                    widget.provider.loadEvaluation(clearData: true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 4.w),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: widget.provider.selected == 3
                            ? Colors.red
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text(
                      "中评(${widget.provider.review})",
                      style: TextStyle(
                          color: widget.provider.selected == 3
                              ? Colors.white
                              : Colors.red),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.provider.selected = 4;
                    widget.provider.loadEvaluation(clearData: true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 4.w),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                    /* decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text("差评(${widget.provider.negative})"),*/
                    decoration: BoxDecoration(
                        color: widget.provider.selected == 4
                            ? Colors.red
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Text(
                      "差评(${widget.provider.negative})",
                      style: TextStyle(
                          color: widget.provider.selected == 4
                              ? Colors.white
                              : Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWrapper(
              data:  widget.provider.list ,
              child: ListView.builder(
                controller: _controller,
                itemBuilder: (c, i) => CommentItem(widget.provider.list[i]),
                itemCount: widget.provider.list.length  ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  final CommentData data;

  CommentItem(this.data);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.w),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                         widget.data.avatarUrl))),
            ),
            title: Text(widget.data.nickName),
            trailing: Text(
              widget.data.createTime,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(widget.data.content),
          ),
          if (widget.data.images.length == 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              child: Image.network(
                widget.data.images[0]??"",
                width: 200.w,
                height: 200.w,
                fit: BoxFit.fill,
              ),
            ),
          if (widget.data.images.length == 2)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Image.network(
                        widget.data.images[0]??"",
                        width: 128.w,
                        height: 128.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Image.network(
                        widget.data.images[1]??"",
                        width: 128.w,
                        height: 128.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )),
          if (widget.data.images.length == 3)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Image.network(
                          widget.data.images[0]??"",
                          width: 110.3.w,
                          height: 110.3.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Image.network(
                          widget.data.images[1]??"",
                          width: 110.3.w,
                          height: 110.3.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Image.network(
                          widget.data.images[2]??"",
                          width: 110.3.w,
                          height: 110.3.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                )),
          ListTile(
            leading: Text(
              "黄桃3斤装",
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Text(
              "2020-06-20",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }
}
