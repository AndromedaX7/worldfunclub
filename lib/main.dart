import 'package:flutter/material.dart';
import 'package:worldfunclub/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  static var navigatorKey = GlobalKey<NavigatorState>();

  static var mainKey = GlobalKey<MainPageState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "环球途乐会",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MainPage(key: mainKey),
      navigatorKey: navigatorKey,
    );
  }
}

class MainPage extends StatefulWidget {
  final Key key;

  MainPage({this.key}) :super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  static MainState state = MainState.MAIN;

  DateTime _lastQuitTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastQuitTime == null ||
            DateTime.now().difference(_lastQuitTime).inSeconds > 2) {
          print('再按一次 Back 按钮退出');
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('再按一次 Back 按钮退出')));
          _lastQuitTime = DateTime.now();
          return false;
        } else {
          print('退出');
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Scaffold(
        body: home(),
      ),
    );
  }

  Widget home() {
    switch (state) {
      case MainState.MAIN:
        return HomePage();
        break;
      case MainState.LoginWechat:
        return Text("LoginWechat");
        break;
      case MainState.Phone:
        return Text("Phone");
        break;
    }
    return Container();
  }

  void changeToLogin() {
    setState(() {
      state = MainState.LoginWechat;
    });
  }
}

enum MainState {
  MAIN,
  LoginWechat,
  Phone,
}

const String user_id = "10024";
const String login_token = "b3e0e4fcdf600d71b747e3b0d915099cd7bd980b";
