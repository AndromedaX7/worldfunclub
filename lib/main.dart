import 'package:flutter/material.dart';
import 'package:worldfunclub/dartin_module.dart';
import 'package:worldfunclub/ui/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDartIn();
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
      home: MainPage(mainKey), //key: mainKey
      navigatorKey: navigatorKey,
    );
  }
}

String userId = "";
String loginToken = "";
String avatar = "";
String nickName = "";
String userType = "";
bool bindPhone = false;
