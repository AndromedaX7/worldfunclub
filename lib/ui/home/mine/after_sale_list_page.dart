import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/after_sale_list_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AfterSaleListPage extends ProviderWidget<AfterSaleListPageProvider> {
  final String type;
  AfterSaleListPage(this.type) : super(params: [type]);

  @override
  Widget buildContent(BuildContext context,
      AfterSaleListPageProvider provider) {
    return _AfterSaleListPageContent(provider);
  }
}

class _AfterSaleListPageContent extends StatefulWidget {
  final AfterSaleListPageProvider provider;

  _AfterSaleListPageContent(this.provider);

  @override
  _AfterSaleListPageContentState createState() =>
      _AfterSaleListPageContentState();
}

class _AfterSaleListPageContentState extends State<_AfterSaleListPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListWrapper(
      data:widget.provider.data,
      child: ListView.builder(
        itemCount: widget.provider.data.length,
        itemBuilder: (bc,i)=>buildItem(widget.provider.data[i]),
      ),
    );
  }

  Widget buildItem(RefundListData data){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.w),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      data.goods_image,
                    ),
                  ),
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(4.w),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Container(
                  height: 60.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.goods_name,
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.black87),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.goods_attr,
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.black26),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            "￥${data.total_price}",
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.black87),
                          ),
                          Spacer(),
                          Text("x${data.total_num}",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black26)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(data.refund_text,style: TextStyle(color: Colors.red,fontSize: 14.w),),
          )
        ],
      ),
    ) ;
  }
}
