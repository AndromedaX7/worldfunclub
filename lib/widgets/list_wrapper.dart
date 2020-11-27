import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ListWrapper extends StatelessWidget {
  final List data;
  final Widget child;

  ListWrapper({this.data, this.child});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty)
      return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/ic_empty.png",width: 225.w,height: 152.w,),
            SizedBox(height: 40.w,),
            Text("暂无数据哦~",style: TextStyle(color: Color(0xFFB5BFCE),fontSize: 14.sp),)
          ],
        ),
      );
    else
      return child;
  }
}
