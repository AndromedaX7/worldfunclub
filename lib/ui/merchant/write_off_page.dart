import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/write_off_page_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WriteOffPage extends ProviderWidget<WriteOffPageProvider> {

  WriteOffPage() : super();

  @override
  Widget buildContent(BuildContext context, WriteOffPageProvider provider) {
    return _WriteOffPageContent(provider);
  }
}

class _WriteOffPageContent extends StatefulWidget {
  final WriteOffPageProvider provider;

  _WriteOffPageContent(this.provider);

  @override
  _WriteOffPageContentState createState() => _WriteOffPageContentState();
}

class _WriteOffPageContentState extends State<_WriteOffPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(brightness: Brightness.dark,
        title: Text("商家核销"),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.w,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: ListTile(
              leading: Text("核销码:",style: TextStyle(color: Colors.red,fontSize: 17.sp,fontWeight: FontWeight.bold),),
              title: Text("123456789",style: TextStyle(color: Colors.red,fontSize: 17.sp,fontWeight: FontWeight.bold),),
            ),
          ),

          SizedBox(height: 16.w,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Column(
              children: [
                ListTile(
                  title:Text("订单信息"),
                  leading: Image.asset("images/ic_shop.png"),
                ),
                Container(
                  height:1.w ,
                  color: Colors.black12,
                ),
                ListTile(
                  leading: Text("订单单号："),
                ),
                ListTile(
                  leading: Text("购买数量："),
                ),
                ListTile(
                  leading: Text("用户姓名："),
                ),
                ListTile(
                  leading: Text("商品名称："),
                ),
                ListTile(
                  leading: Text("剩余核销次数："),
                ),
                ListTile(
                  leading: Text("联系电话："),
                ),
                ListTile(
                  leading: Text("有效日期："),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.w,),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              child: Container(
                height: 48.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: Text("立即核销",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
