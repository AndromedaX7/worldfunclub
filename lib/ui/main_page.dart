import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/ui/main_ui.dart';

class MainPage extends StatefulWidget {
  final Key key;

  MainPage(this.key) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _lastQuitTime = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().millisecondsSinceEpoch - _lastQuitTime > 2000) {
          print('再按一次 Back 按钮退出');
          Fluttertoast.showToast(msg: "再按一次 Back 按钮退出");
          _lastQuitTime = DateTime.now().millisecondsSinceEpoch;
          return false;
        } else {
          print('退出');
          return true;
        }
      },
      child: MainUi(),
    );
  }
}
