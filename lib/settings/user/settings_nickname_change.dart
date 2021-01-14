import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsNickNameChangePage extends StatefulWidget {
  @override
  _SettingsNickNameChangePageState createState() => _SettingsNickNameChangePageState();
}

class _SettingsNickNameChangePageState extends State<SettingsNickNameChangePage> {
  String nickName = "";
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller=TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("昵称"),
        actions: [
          TextButton(
            child: Text(
              "保存",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16.w),
        padding: EdgeInsets.only(left:16.w,right: 16.w),
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: TextField(controller: controller,
                onChanged: changeNickName,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                controller.clear();
              },
            )
          ],
        ),
      ),
    );
  }

  void changeNickName(String nickName) {
    this.nickName = nickName;
  }
}
