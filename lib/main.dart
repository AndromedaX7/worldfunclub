import 'package:flutter/material.dart';
import 'package:worldfunclub/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "环球途乐会",
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainState state = MainState.MAIN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home(),
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
}

enum MainState {
  MAIN,
  LoginWechat,
  Phone,
}
const String user_id = "10015";
const String login_token = "3e94ff4df240ecdfbd5ff79702fec4a0d5ae93f2";
