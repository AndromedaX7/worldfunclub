import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/permission_handler_page_provider.dart';

class PermissionHandlerPage
    extends ProviderWidget<PermissionHandlerPageProvider> {
  PermissionHandlerPage() : super();

  @override
  Widget buildContent(BuildContext context,
      PermissionHandlerPageProvider provider) {
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
  bool storageEnable = false;
  bool locationEnable = false;
  bool cameraEnable = false;

  @override
  void initState() {
    super.initState();
    Permission.camera.isGranted.then((value) {
      setState(() {
        cameraEnable = value;
      });
    });
    Permission.location.isGranted.then((value) {
      setState(() {
        locationEnable = value;
      });
    });
    Permission.storage.isGranted.then((value) {
      setState(() {
        storageEnable = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("权限设置"),
        brightness: Brightness.dark,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              if (!locationEnable) {
                Permission.location.request().then((value) {
                  setState(() {
                    locationEnable = value.isGranted;
                  });
                });
              }
            },
            tileColor: Colors.white,
            title: Text("允许途乐会获取地理信息"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(locationEnable ? "已开启" : "点我开启"),
                Icon(Icons.navigate_next)
              ],

            ),
          ),
          ListTile(
            tileColor: Colors.grey[100],
            title: Text(
              "方便您在需要定位业务下的定位。关于《位置信息》",
              style: TextStyle(fontSize: 12.sp, color: Colors.black26),
            ),
          ),
          ListTile(
            onTap: () {
              if (!cameraEnable) {
                Permission.camera.request().then((value) {
                  setState(() {
                    cameraEnable = value.isGranted;
                  });
                });
              }
            },
            tileColor: Colors.white,
            title: Text("允许途乐会访问相机"),
            trailing:

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(cameraEnable ? "已开启" : "点我开启"),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          ListTile(
            tileColor: Colors.grey[100],
            title: Text(
              "实现您购物拍摄用户评价。关于《访问相机》",
              style: TextStyle(fontSize: 12.sp, color: Colors.black26),
            ),
          ),
          ListTile(
            onTap: () {
              if (!storageEnable) {
                Permission.storage.request().then((value) {
                  setState(() {
                    storageEnable = value.isGranted;
                  });
                });
              }
            },
            tileColor: Colors.white,
            title: Text("允许途乐会访问相册"),
            trailing:
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(storageEnable ? "已开启" : "点我开启"),
                Icon(Icons.navigate_next)
              ],

            ),
          ),
          ListTile(
            tileColor: Colors.grey[100],
            title: Text(
              "实现您图片/视频的取用与上传。关于《访问相册》",
              style: TextStyle(fontSize: 12.sp, color: Colors.black26),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text("《隐私权政策》"),
          ),
        ],
      ),
    );
  }
}
