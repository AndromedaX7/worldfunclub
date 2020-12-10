import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class VerificationPhonePage extends StatefulWidget {
  final String title;

  final String phone;
  final VerificationPhoneState state;

  VerificationPhonePage(
    this.state, {
    this.title = "",
    this.phone = "",
  });

  @override
  _VerificationPhonePageState createState() => _VerificationPhonePageState();
}

class _VerificationPhonePageState extends State<VerificationPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
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
              child: Text("当前手机号码：${widget.phone}"),
            ),
            EditorLinearBar(
              title: "验证码：",
              commit: "获取验证码",
              onTap: () {
                switch (widget.state) {
                  case VerificationPhoneState.changePhone:
                    break;
                  case VerificationPhoneState.changePayPassword:
                    sendChangePayPasswordAuthCode();
                    break;
                }
              },
              editor: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "请输入验证码"),
              ),
            ),
            SizedBox(
              height: 56.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(true);
              },
              child: Container(
                width: double.infinity,
                height: 48.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                    color: Color(0xFFE33541)),
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendChangePayPasswordAuthCode() {}
}

enum VerificationPhoneState {
  changePhone,
  changePayPassword,
}
