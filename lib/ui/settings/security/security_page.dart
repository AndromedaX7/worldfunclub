import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/settings/security/security_change_pay_password.dart';
import 'package:worldfunclub/settings/security/verification_phone.dart';
import 'package:worldfunclub/ui/settings/security/permission_handler_page.dart';
import 'package:worldfunclub/ui/settings/security/security_change_phone.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/vm/security_page_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/item_tile.dart';
class SecurityPage extends ProviderWidget<SecurityPageProvider> {

  SecurityPage() : super();

  @override
  Widget buildContent(BuildContext context, SecurityPageProvider provider) {
    return _SecurityPageContent(provider);
  }
}

class _SecurityPageContent extends StatefulWidget {
  final SecurityPageProvider provider;

  _SecurityPageContent(this.provider);

  @override
  _SecurityPageContentState createState() => _SecurityPageContentState();
}

class _SecurityPageContentState extends State<_SecurityPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账号与安全"),brightness: Brightness.dark,
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
            if (enable)
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
            if (enable)
              SizedBox(
                height: 1.w,
              ),
            if (enable)
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => PermissionHandlerPage()));
                },
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("权限设置"),
              ),
            ),

            Spacer(),
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
                    "注销账户",
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

  void changeMobilePhone() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (b) => SecurityChangePhonePage()))
        .then((value) {
      setState(() {
        Log.e(mobile);
      });
    });
  }

  void changePayPassword() async {
    bool result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (b) =>
            VerificationPhonePage(
              VerificationPhoneState.changePayPassword,
              title: "设置支付密码",
              phone: "$mobile",
            )));
    if (result) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (b) => SecurityChangePayPasswordPage()));
    }
    //
  }

  void showExitPage() {
    showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.black26,
      builder: (b) =>
          CupertinoActionSheet(
            title: Text("您可以选择以下操作"),
            message: Text("注销账户是不可逆的行为，\n请确保账户内没有未结算完成的订单\n和未使用的余额。",
              style: TextStyle(color: Colors.red,),),
            actions: [
              CupertinoActionSheetAction(
                child: Text("注销当前账户"),
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
}


