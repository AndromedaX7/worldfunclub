import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserProtocolPage extends StatefulWidget {
  final String title;
  final bool type;

  final String protocolAddress;

  UserProtocolPage(this.title, {this.type = true})
      : protocolAddress = type
            ? "http://shop.tule-live.com/index.php/api/Activity/privacy/headerHeight/-1" //隐私协议
            : "http://shop.tule-live.com/index.php/api/Activity/legal/headerHeight/-1";
  @override
  _UserProtocolPageState createState() => _UserProtocolPageState();
}

class _UserProtocolPageState extends State<UserProtocolPage> {
  bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 16.sp),),
        brightness: Brightness.dark,
        actions: [
          if(isLoading)
            Padding(
              padding:   EdgeInsets.only(right: 24.w),
              child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), ),),
            ),

        ],
      ),
      body: ListWrapper(
        data: widget.protocolAddress.isEmpty || !widget.protocolAddress.startsWith("http")
            ? []
            : [0],
        child: InAppWebView(
          onLoadStop: (u,s){
           setState(() {
             isLoading=false;
           });
          },
          onLoadStart: (u,s){
            setState((){
              isLoading=true;
            });
          },
          initialUrl: widget.protocolAddress,
        ),
      ),
    );
  }
}
