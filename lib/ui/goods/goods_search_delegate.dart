import 'package:flutter/material.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/ui/goods/goods_search_page.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GoodsSearchDelegate extends SearchDelegate<String> with LoadMoreMinix {
  final GoodsType type;
  GlobalKey<GoodsSearchPageContentState> opKey;

  GoodsSearchDelegate({this.type = GoodsType.self}) : opKey = GlobalKey();

  String _hint = "请输入商品名称";

  List<String> suggestions = ["口罩","防护服"];
  List<String> sourceList = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showResults(context);
          if (query.isNotEmpty && !sourceList.contains(query))
            sourceList.add(query);
          opKey.currentState.search(query, type);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),

      ///调用 close 关闭 search 界面
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GoodsSearchPage(query, type, opKey);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty
        ? suggestions
        : sourceList.where((input) => input.startsWith(query)).toList();

    return Container(
      margin: EdgeInsets.only(top: 20.w),
      child: Wrap(
        children:
          List.generate(suggest.length, (index) =>  InkWell(
            child: Container(padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.w),
              decoration: BoxDecoration(
                color: Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(4.w),
              ),
              margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.w),
              child: RichText(
                text: TextSpan(
                  text: suggest[index].substring(0, query.length),
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
              showResults(context);
            },
          ))
      ),
    );

   /* return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: ListTile(
          title: RichText(
            text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggest[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //  query.replaceAll("", suggest[index].toString());
          _hint = "";
          query = suggest[index].toString();
          showResults(context);
        },
      ),
    );*/
  }

  @override
  String get searchFieldLabel => _hint;
}
