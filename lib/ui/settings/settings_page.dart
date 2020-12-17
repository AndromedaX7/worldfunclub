import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/settings/security/security_page.dart';
import 'package:worldfunclub/settings/user/settings_user_info.dart';
import 'package:worldfunclub/ui/address/address_list_page.dart';
import 'package:worldfunclub/ui/settings/about/about_page.dart';
import 'package:worldfunclub/vm/settings_provider.dart';

class SettingsPage extends ProviderWidget<SettingsPageProvider> {
  SettingsPage() : super();

  @override
  Widget buildContent(BuildContext context, mProvider) {
    return _SettingsPageContent(mProvider);
  }
}

class _SettingsPageContent extends StatefulWidget {
  final SettingsPageProvider provider;

  _SettingsPageContent(this.provider);

  @override
  _SettingsPageContentState createState() => _SettingsPageContentState();
}

class _SettingsPageContentState extends State<_SettingsPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),brightness: Brightness.dark,
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            if (enable)
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text("个人资料"),
                  onTap: userInfo,
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            if (enable)
              SizedBox(
                height: 1.w,
              ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: security,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("账号与安全"),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: address,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("我的地址"),
              ),
            ),
            if (enable)
              SizedBox(
                height: 1.w,
              ),
            if (enable)
              Container(
                color: Colors.white,
                child: ListTile(
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xffaaaaaa),
                  ),
                  title: Text("常用购买人信息"),
                ),
              ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("推送通知"),
                subtitle: Text("避免错过订单状态通知-去开启"),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("清理缓存"),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: aboutApp,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("关于环球途乐会"),
              ),
            ),
            Spacer(),
            // Container(
            //   color: Colors.white,
            //   child: GestureDetector(
            //     onTap: (){
            //       widget.provider.logout(context);
            //     },
            //     child: AppBar( elevation: 0,
            //       centerTitle: true,
            //       backgroundColor: Colors.white,
            //       title: Text(
            //         "注销账户",
            //         style: TextStyle(color: Colors.red,fontSize: 16.sp),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 14.w,),
            Container(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  showExitPage();
                },
                child: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "退出登录",
                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.w,
            )
          ],
        ),
      ),
    );
  }

  void showExitPage() {
    showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.black26,
      builder: (b) => CupertinoActionSheet(
        title: Text("您可以选择以下操作"),
        // message: Text("上传照片"),
        actions: [
            CupertinoActionSheetAction(
              child: Text("退出当前账户"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                widget.provider.logout(context);
              },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: (() {
            Navigator.of(context).pop();
          }),
          isDefaultAction: false,
          child: Text("取消"),
        ),
      ),
    );
  }

  void userInfo() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsUserInfoPage()));
  }

  void security() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (c) => SecurityPage()));
  }

  void address() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (c) => AddressListPage()));
  }

  void aboutApp() {
    Navigator.of(context).push(MaterialPageRoute(builder: (c) => AboutPage()));
  }
}
