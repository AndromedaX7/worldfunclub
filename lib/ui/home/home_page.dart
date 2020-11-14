import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/ui/home/club/club_page.dart';
import 'package:worldfunclub/ui/home/home/home_main_page.dart';
import 'package:worldfunclub/ui/home/live/live_page.dart';
import 'package:worldfunclub/ui/home/mine/mine_page.dart';
import 'package:worldfunclub/ui/home/vip/vip_page.dart';
import 'package:worldfunclub/ui/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // initDesignSize(context, 1920, 1080);
    return Scaffold(
      body: Container(
        child: drawPage()[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            pageIndex = i;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset("images/ic_home.webp"),
              icon: Image.asset("images/ic_home_def.webp"),
              // icon: Icon(
              //   Icons.home,
              // ),
              label: "首页"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("images/ic_vip.webp"),
              icon: Image.asset("images/ic_vip_def.webp"),
              // icon: Icon(
              //   Icons.audiotrack,
              // ),
              label: "会员"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("images/ic_local.webp"),
              icon: Image.asset("images/ic_local_def.webp"),
              // icon: Icon(
              //   Icons.delivery_dining,
              // ),
              label: "本地"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("images/ic_club.webp"),
              icon: Image.asset("images/ic_club_def.webp"),
              // icon: Icon(
              //   CupertinoIcons.suit_club_fill,
              // ),
              label: "社区"),
          BottomNavigationBarItem(
              // icon: Icon(
              //   Icons.person,
              // ),
              activeIcon: Image.asset("images/ic_mine.webp"),
              icon: Image.asset("images/ic_mine_def.webp"),
              label: "我的"),
        ],
      ),
    );
  }

  List<Widget> drawPage() {
    List<Widget> content = List();
    return content
      ..add(HomeMainPage())
      ..add(VipPage())
      ..add(LivePage())
      ..add(ClubPage())
      ..add(MinePage());
  }
}
