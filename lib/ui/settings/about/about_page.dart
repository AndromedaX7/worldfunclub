import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/ui/settings/protocol/user_protocol_page.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于环球途乐会"),brightness: Brightness.dark,
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("用户注册及使用App隐私协议"),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>UserProtocolPage("用户注册及使用App隐私协议"))),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>UserProtocolPage("环球途乐会用户协议和法律协议",type: false,))),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("环球途乐会用户协议和法律协议"),
              ),
            ),
            if(enable)
              SizedBox(
                height: 1.w,
              ),
            if(enable)
              Container(
                color: Colors.white,
                child: ListTile(
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xffaaaaaa),
                  ),
                  title: Text("消费者权益保障相关规则"),
                ),
              ),
            if(enable)
              SizedBox(
                height: 1.w,
              ),
            if(enable)
              Container(
                color: Colors.white,
                child: ListTile(
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xffaaaaaa),
                  ),
                  title: Text("平台证照"),
                ),
              ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: version,
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("当前版本"),
                subtitle: Text("Flutter ${Platform.version}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void version() {
    showDialog(
        context: context,
        builder: (b) => AboutDialog(
          applicationName: "环球途乐会",
          applicationVersion: "Flutter-1.0.0",
          applicationLegalese:
          "请将109行字符串换成关于app的文案。",
          applicationIcon: Image.asset("images/ic_launcher.png",width: 55.w,height: 55.w,),
        ));
  }
}
