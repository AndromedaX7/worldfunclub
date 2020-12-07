import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/settings/security/security_change_pay_password.dart';
import 'package:worldfunclub/settings/security/security_change_phone.dart';
import 'package:worldfunclub/settings/security/verification_phone.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class SecurityPage extends StatefulWidget {
  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账号与安全"),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: LinearTextBar(
                onTap: changeMobilePhone,
                title: ("修改登录手机号"),
                subTitle: "$mobile",
                subTitleColor: Color(0xffa9a9a9),
                // onTap: userInfo,
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
              child: ListTile(
                onTap: changePayPassword,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("设置/修改支付密码"),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: LinearTextBar(
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: ("绑定微信号"),
                subTitle: "已绑定",
                subTitleColor: Color(0xFFA9A9A9),
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
                title: Text("权限设置"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeMobilePhone()async {
      Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => SecurityChangePhonePage())).then((value) {
          setState(() {

          });
      });

  }

  void changePayPassword() async {
    bool result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => VerificationPhonePage(VerificationPhoneState.changePayPassword,title: "设置支付密码",phone: "$mobile",)));
    if(result){
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (b) => SecurityChangePayPasswordPage()));
    }
    //
  }
}
