import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/design.dart';
import 'package:worldfunclub/home/home/home_main_page.dart';
import 'package:worldfunclub/home/vip/vip_page.dart';
import 'package:worldfunclub/settings/settings_page.dart';
import 'package:worldfunclub/home/live/live_page.dart';
import 'mine/mine_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pageIndex =0;
  @override
  Widget build(BuildContext context) {
    // initDesignSize(context, 1920, 1080);
    initDefaultDesignSize(context);
    return Scaffold(

      body: Container(
        child: drawPage()[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,onTap: (i){setState(() {
        pageIndex=i;
      });},currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack,),label: "会员"),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining,),label: "乐活"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.suit_club_fill,),label: "社区"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: "我的"),
        ],
      ),
    );
  }


  List<Widget> drawPage(){
    List<Widget> content =List();
    return content..add(HomeMainPage())
      ..add(VipPage())
      ..add(LivePage())
      ..add(SettingsPage())
      ..add(MinePage())
    ;

  }


}
