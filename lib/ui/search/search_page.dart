import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/goods_search_page.dart';
import 'package:worldfunclub/vm/search_page_provider.dart';

class SearchPage extends   StatefulWidget {
  final GoodsType type;
  SearchPage(this.type);

  @override
  _SearchPageContentState createState() => _SearchPageContentState();
}

class _SearchPageContentState extends State<SearchPage> {
  GlobalKey<GoodsSearchPageContentState> opKey = GlobalKey();
  TextEditingController _controller;
  String query = "";

  List<String> suggestions = ["口罩", "防护服"];
  List<String> sourceList = [];

  int pos = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController.fromValue(TextEditingValue(
      // 设置内容
        text: query,
        // 保持光标在最后
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: query.length)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _controller.clear();
                  query = "";
                  pos = 0;
                });
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (query.isNotEmpty && !sourceList.contains(query))
                  sourceList.add(query);
                setState(() {
                  pos = 1;
                 Future.delayed(Duration(milliseconds: 100)).then((value) =>
                     opKey.currentState.search(query, GoodsType.self));
                });
              })
        ],
        backgroundColor: Colors.white,
        title: TextField(
          controller: _controller,
          onChanged: (s) {
            query = s;
            setState(() {
              pos = 0;
            });
          },
          style: TextStyle(fontSize: 18.sp),
          decoration: InputDecoration(
              border: UnderlineInputBorder(), hintText: "请输入搜索内容"),
        ),
      ),
      body: buildSearchInfo(context),
    );
  }

  Widget buildSearchInfo(BuildContext context) {
    return  pos == 0 ?
        buildSuggestions(context):
              Container(child: GoodsSearchPage(query, GoodsType.self, opKey)
    );
  }

  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty
        ? suggestions
        : sourceList.where((input) => input.startsWith(query)).toList();

    return Container(
      margin: EdgeInsets.only(top: 20.w),
      child: Wrap(
          children: List.generate(
              suggest.length,
              (index) => InkWell(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                      decoration: BoxDecoration(
                        color: Color(0xffeeeeee),
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                      child: RichText(
                        text: TextSpan(
                          text: suggest[index].substring(0, query.length),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: suggest[index].substring(query.length),
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      //  query.replaceAll("", suggest[index].toString());
                      // _hint = "";
                      query = suggest[index].toString();
                      _controller.text=query;
                      setState(() {
                        pos = 1;
                        Future.delayed(Duration(milliseconds: 100)).then((value) =>
                            opKey.currentState.search(query, GoodsType.self));
                      });
                    },
                  ))),
    );
  }
}
