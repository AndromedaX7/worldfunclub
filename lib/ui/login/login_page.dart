import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/login/login_phone_page.dart';
import 'package:worldfunclub/vm/login_page_provider.dart';

class LoginPage extends ProviderWidget<LoginPageProvider> {
  LoginPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _LoginPageContent(mProvider);
  }
}

class _LoginPageContent extends StatefulWidget {
  final LoginPageProvider provider;

  _LoginPageContent(this.provider);

  @override
  _LoginPageContentState createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<_LoginPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 667.h,
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
                  fontWeight: FontWeight.w600),
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
              ),
            ),
            left: 26.h,
            top: 124.h,
          ),
          Positioned(
            child: GestureDetector(
              onTap: () => widget.provider.loginWechat(),
              child: Container(
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Color(0xFF1AAD19),
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "images/wechat.webp",
                          width: 22.h,
                          height: 18.h,
                        ),
                        SizedBox(
                          width: 4.h,
                        ),
                        Text(
                          "微信一键登录",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
            ),
            left: 24.h,
            bottom: 190.h,
            right: 24.h,
          ),
          Positioned(
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => LoginPhonePage())),
              child: Container(
                  height: 50.w,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "手机号码登录",
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 14.sp,
                          ),
                        ),
                        Icon(Icons.navigate_next, color: Color(0xFFAAAAAA))
                      ],
                    ),
                  )),
            ),
            left: 24.h,
            bottom: 140.h,
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
                    style: TextStyle(fontSize: 11.sp, color: Color(0xFFAAAAAA)),
                  ),
                  Text(
                    "《环球途乐会用户协议》",
                    style: TextStyle(fontSize: 11.sp, color: Color(0xFF4E93E2)),
                  ),
                  Text(
                    "和",
                    style: TextStyle(fontSize: 11.sp, color: Color(0xFFAAAAAA)),
                  ),
                  Text(
                    "《环球途乐会用户隐私政策》",
                    style: TextStyle(fontSize: 11.sp, color: Color(0xFF4E93E2)),
                  ),
                ],
              ),
            ),
            bottom: 70.h,
          )
        ],
      ),
    );
  }
}
