import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/design.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    initDefaultDesignSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("关于环球途乐会"),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("隐私权政策"),
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
                trailing: Icon(
                  Icons.navigate_next,
                  color: Color(0xffaaaaaa),
                ),
                title: Text("环球途乐会用户协议"),
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
                title: Text("消费者权益保障相关规则"),
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
                  "实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等），如下面的代码运行后会报错。",
              applicationIcon: Image.asset("images/ic_launcher.png",width: 55.w,height: 55.w,),
            ));
  }
}
