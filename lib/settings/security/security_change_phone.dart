import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/settings.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class SecurityChangePhonePage extends StatefulWidget {
  @override
  _SecurityChangePhonePageState createState() =>
      _SecurityChangePhonePageState();
}

class _SecurityChangePhonePageState extends State<SecurityChangePhonePage> {
  String phone = "";
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手机号更换"),
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
              child: Text("绑定新的手机号码"),
            ),
            EditorLinearBar(
              title: "手机号：",
              editor: TextField(
                onChanged: (s) {
                  phone = s;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "请输入手机号"),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            EditorLinearBar(
              onTap: () {
                sendChangePhoneAuthCode();
              },
              commit: "获取验证码",
              title: "验证码：",
              editor: TextField(
                onChanged: (s) {
                  code = s;
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "请输入验证码"),
              ),
            ),
            SizedBox(
              height: 56.w,
            ),
            GestureDetector(
              onTap: () {
                if (phone.isNotEmpty && code.isNotEmpty) confirmChange();
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

  void sendChangePhoneAuthCode() {
    api.sendChangePhoneAuthCode(phone).listen((event) {
      Fluttertoast.showToast(msg: EmptyDataResp.fromJson(event).msg);
    });
  }

  void confirmChange() {
    api.changePhone(phone, code).listen((event) {
      var resp =ChangePhoneResp.fromJson(event);
      if(resp.code == 1){
        mobile =resp.data.mobile;
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(msg: resp.msg);
    });
  }
}
