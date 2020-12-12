import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/permission_handler_page_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PermissionHandlerPage
    extends ProviderWidget<PermissionHandlerPageProvider> {
  PermissionHandlerPage() : super();

  @override
  Widget buildContent(
      BuildContext context, PermissionHandlerPageProvider provider) {
    return _PermissionHandlerPageContent(provider);
  }
}

class _PermissionHandlerPageContent extends StatefulWidget {
  final PermissionHandlerPageProvider provider;

  _PermissionHandlerPageContent(this.provider);

  @override
  _PermissionHandlerPageContentState createState() =>
      _PermissionHandlerPageContentState();
}

class _PermissionHandlerPageContentState
    extends State<_PermissionHandlerPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("权限设置"),
        brightness: Brightness.dark,
      ),
      body: Column(
        children: [
          ListTile(tileColor: Colors.white,
            title: Text("允许途乐会获取地理信息"),
          ),
          ListTile(tileColor: Colors.grey[100],
            title: Text("方便您在需要定位业务下的定位。关于《位置信息》",style: TextStyle(fontSize: 12.sp,color: Colors.black26),),
          ),
          ListTile(tileColor: Colors.white,
            title: Text("允许途乐会获取地理信息"),
          ),
          ListTile(tileColor: Colors.grey[100],
            title: Text("方便您在需要定位业务下的定位。关于《位置信息》",style: TextStyle(fontSize: 12.sp,color: Colors.black26),),
          ),
          ListTile(tileColor: Colors.white,
            title: Text("允许途乐会获取地理信息"),
          ),
          ListTile(tileColor: Colors.grey[100],
            title: Text("方便您在需要定位业务下的定位。关于《位置信息》",style: TextStyle(fontSize: 12.sp,color: Colors.black26),),
          ),
          ListTile(tileColor: Colors.white,
            title: Text("允许途乐会获取地理信息"),
          ),
        ],
      ),
    );
  }
}
