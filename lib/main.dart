import 'package:flutter/material.dart';
import 'package:worldfunclub/dartin_module.dart';
import 'package:worldfunclub/ui/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDartIn();
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

const String user_id = "10043";
const String login_token = "fefab20ccaa77ec55bd2593e28415638309d995e";
