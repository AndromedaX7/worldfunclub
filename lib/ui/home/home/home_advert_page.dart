import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/active_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/home_advert_page_provider.dart';

class HomeAdvertPage extends ProviderWidget<HomeAdvertPageProvider> {
  HomeAdvertPage(String _id, String _sign, String _name)
      : super(params: [_id, _sign, _name]);

  @override
  Widget buildContent(BuildContext context) {
    return _HomeAdvertPageContent(mProvider);
  }
}

class _HomeAdvertPageContent extends StatefulWidget {
  final HomeAdvertPageProvider provider;

  _HomeAdvertPageContent(this.provider);

  @override
  _HomeAdvertPageContentState createState() => _HomeAdvertPageContentState();
}

class _HomeAdvertPageContentState extends State<_HomeAdvertPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(widget.provider.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.provider.goods.length,
          itemBuilder: (c, i) => _buildGoodsItem(widget.provider.goods[i]),
        ),
      ),
    );
  }

  Widget _buildGoodsItem(ActiveGoods goods) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.w),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4),
      child: Row(
        children: [
          Image.network(
            goods.itemPicture,
            width: 130.w,
            height: 130.w,
          ),
          Container(
            margin: EdgeInsets.only(left: 14.w),
            width: 203.w,
            height: 130.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                          child: Image.asset(
                        "images/Cart.png",
                        width: 15.w,
                        height: 15.w,
                      )),
                      TextSpan(
                        text: "${goods.itemTitle}",
                        style: TextStyle(),
                      )
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12.w,
                ),
                Text(
                  "已售：25",
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "￥",
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: "${goods.itemFinalPrice}",
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.black87),
                          ),
                          TextSpan(
                              text: "￥${goods.itemPrice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
