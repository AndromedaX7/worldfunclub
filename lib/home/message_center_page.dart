import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MessageCenterPage extends StatefulWidget {
  @override
  _MessageCenterPageState createState() => _MessageCenterPageState();
}

class _MessageCenterPageState extends State<MessageCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("消息中心"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.add_alert),
                title: Text("服务消息"),
                subtitle: Text("年货秒杀补贴最后一天"),
              ),
            ),
            SizedBox(height: 10.w,),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.speaker_phone),
                title: Text("平台活动"),
                subtitle: Text("年货秒杀补贴最后一天"),
              ),
            ),
            SizedBox(height: 10.w,),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.speaker_phone),
                title: Text("客服留言消息"),
                subtitle: Text("年货秒杀补贴最后一天"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
