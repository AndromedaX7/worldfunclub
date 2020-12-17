import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/security_change_phone_page_provider.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class SecurityChangePhonePage
    extends ProviderWidget<SecurityChangePhonePageProvider> {
  SecurityChangePhonePage() : super();

  @override
  Widget buildContent(
      BuildContext context, SecurityChangePhonePageProvider provider) {
    return _SecurityChangePhonePageContent(provider);
  }
}

class _SecurityChangePhonePageContent extends StatefulWidget {
  final SecurityChangePhonePageProvider provider;

  _SecurityChangePhonePageContent(this.provider);

  @override
  _SecurityChangePhonePageContentState createState() =>
      _SecurityChangePhonePageContentState();
}

class _SecurityChangePhonePageContentState
    extends State<_SecurityChangePhonePageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手机号更换"),brightness: Brightness.dark,
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
                  widget.provider.phone = s;
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
                widget.provider.sendChangePhoneAuthCode();
              },
              commit: "获取验证码",
              title: "验证码：",
              editor: TextField(
                onChanged: (s) {
                  widget.provider.code = s;
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
                widget.provider.confirmChange(context);
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
}
