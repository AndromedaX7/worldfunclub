import 'package:flutter/material.dart';
import 'package:worldfunclub/dartin_module.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/ui/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDartIn();
  LocalChannel.listener(LocalChannelResponseDefault() );
  runApp(App());
}
class LocalChannelResponseDefault extends LocalChannelResponse{
  @override
  void wechatCode(String code) {
  }

}
class App extends StatelessWidget {
  static var navigatorKey = GlobalKey<NavigatorState>();

  static var mainKey = GlobalKey<MainPageState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "环球途乐会",
      darkTheme:ThemeData(primarySwatch: Colors.blue,brightness: Brightness.dark,) ,
      theme: ThemeData(primarySwatch: Colors.red,brightness: Brightness.light,),
      home: MainPage(mainKey), //key: mainKey
      navigatorKey: navigatorKey,
    );
  }
}

String userId = "";
String token = "";
String avatar = "";
String nickName = "";
String userType = "";
bool bindPhone = false;
String mobile="";

bool enable=true;