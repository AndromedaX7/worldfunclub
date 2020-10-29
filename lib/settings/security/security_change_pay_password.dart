import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class SecurityChangePayPasswordPage extends StatefulWidget {
  @override
  _SecurityChangePayPasswordPageState createState() =>
      _SecurityChangePayPasswordPageState();
}

class _SecurityChangePayPasswordPageState extends State<SecurityChangePayPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置支付密码"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 14.w),
              width: double.infinity,
              height: 55.w,
              color: Color(0xfff5f5f5),
              child: Text("设置新的密码"),
            ),
            EditorLinearBar(
              title: "新密码：",
              editor: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入支付密码"
                ),
              ),
            ),
            SizedBox(height: 1.w,),
            EditorLinearBar(
              title: "确认新密码：",
              editor: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请确认途乐会支付密码"
                ),
              ),
            ),
            SizedBox(height: 16.w,),
            Padding(
              padding:   EdgeInsets.only(left: 24.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("密码由6-8位字母或数字组成"),
              ),
            ),
            SizedBox(height: 30.w,),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 48.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                    color: Color(0xFFE33541)
                ),
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Text("确定",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
