import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/address/address_page.dart';
import 'package:worldfunclub/design.dart';
import 'package:worldfunclub/settings/about/about_page.dart';
import 'package:worldfunclub/settings/security/security.dart';
import 'package:worldfunclub/settings/user/settings_user_info.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
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
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile( onTap: security,
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
            Container(
              color: Colors.white,
              child: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  "退出登录",
                  style: TextStyle(color: Colors.red),
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

  void userInfo() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsUserInfoPage()));
  }

  void security(){
    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>SecurityPage()));
  }

  void address(){
    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>AddressListPage()));
  }

  void aboutApp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>AboutPage()));
  }
}
