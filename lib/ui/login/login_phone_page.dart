import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/login_phone_provider.dart';
class LoginPhonePage extends ProviderWidget<LoginPhonePageProvider> {
  LoginPhonePage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _LoginPhonePageContent(mProvider);
  }
}

class _LoginPhonePageContent extends StatefulWidget {
  final LoginPhonePageProvider provider;

  _LoginPhonePageContent(this.provider);

  @override
  _LoginPhonePageContentState createState() => _LoginPhonePageContentState();
}

class _LoginPhonePageContentState extends State<_LoginPhonePageContent> {
  TextEditingController _phoneController;
  TextEditingController _authController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: "");
    _authController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 600.h,
            ),
            Positioned(
              child: Image.asset("images/ic_launcher.png"),
              left: 26.h,
              top: 50.h,
              width: 50.h,
              height: 50.h,
            ),
            Positioned(
              child: Text(
                "Hi 你好",
                style: TextStyle(
                    color: Color(0xFFFF354D),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600) ,
              ),
              left: 26.h,
              top: 94.h,
            ),
            Positioned(
              child: Text(
                "环球途乐会欢迎您",
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14.sp,
                ) ,
              ),
              left: 26.h,
              top: 124.h,
            ),
            Positioned(
              child: TextField(
                controller: _phoneController,
                style: TextStyle(fontSize: 20.sp) ,
                textInputAction: TextInputAction.next,
                maxLength: 11,
                onChanged: widget.provider.phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          _phoneController.clear();
                          widget.provider.phone("");
                        }),
                    labelText: "请输入11位手机号码",
                    errorStyle: TextStyle() ,
                    errorText: widget.provider.errorText),
              ),
              top: 170.h,
              left: 26.h,
              right: 26.h,
            ),
            Positioned(
              child: TextField(
                onChanged: widget.provider.code,
                controller: _authController,
                maxLength: 4,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20.sp) ,
                decoration: InputDecoration(
                    labelText: "请输入验证码",
                    suffixIcon: TextButton(
                      onPressed: widget.provider.sendCode,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.w),
                            color: Color(0xFFFF354D)),
                        child: Center(
                          child: Text(
                            "获取验证码",
                            style: TextStyle(color: Colors.white) ,
                          ),
                        ),
                        width: 94.w,
                      ),
                    )),
              ),
              top: 240.h,
              left: 26.h,
              right: 26.h,
            ),
            Positioned(
              child: GestureDetector(
                onTap: () => widget.provider.login(context),
                child: Container(
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF354D),
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "完成",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600) ,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              left: 24.h,
              bottom: 110.h,
              right: 24.h,
            ),
            Positioned(
              child: Container(
                width: 375.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "已阅读并同意",
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xFFAAAAAA)),
                    ),
                    Text(
                      "《环球途乐会用户协议》",
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xFF4E93E2)) ,
                    ),
                    Text(
                      "和",
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xFFAAAAAA)) ,
                    ),
                    Text(
                      "《环球途乐会用户隐私政策》",
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xFF4E93E2)) ,
                    ),
                  ],
                ),
              ),
              bottom: 70.h,
            )
          ],
        ),
      ),
    );
  }
}
