import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/settings/user/settings_nickname_change.dart';
import 'package:worldfunclub/settings/user/settings_user_info_content_change.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class SettingsUserInfoPage extends StatefulWidget {
  @override
  _SettingsUserInfoPageState createState() => _SettingsUserInfoPageState();
}

class _SettingsUserInfoPageState extends State<SettingsUserInfoPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("个人资料"),
      ),
      body: Container(
        color: Color(0xfff5f5f5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: UserIconBar(userIcon: avatar,
                onTap: changeUserIcon,
                title: "头像",
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
              child: LinearTextBar(
                onTap: changeUserNickname,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: "昵称",
                subTitle: "$nickName",
                subTitleColor: Color(0xFF333333),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: LinearTextBar(
                onTap: changeUserInfoContent,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: "个人简介" ,
                subTitle: "去填写",
                subTitleColor:Color(0xFFA9A9A9) ,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeUserIcon() {
    showCupertinoModalPopup(
      context: context,
      builder: (b) =>
          CupertinoActionSheet(
            title: Text("更换头像"),
            message: Text("上传照片"),
            actions: [
              CupertinoActionSheetAction(
                child: Text("拍照上传"),
                isDefaultAction: true,
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: Text("从相册选择"),
                isDefaultAction: true,
                onPressed: () {},
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              isDefaultAction: true,
              child: Text("取消"),
            ),
          ),
    );
  }

  void changeUserNickname() async {
   /* String nickname =*/ await Navigator.of(context).push(
        MaterialPageRoute(builder: (b) => SettingsNickNameChangePage()));
  }

  void changeUserInfoContent() async{
    /*String info = */await Navigator.of(context).push(
        MaterialPageRoute(builder: (b) => SettingsUserInfoContentChangePage()));
  }
}
