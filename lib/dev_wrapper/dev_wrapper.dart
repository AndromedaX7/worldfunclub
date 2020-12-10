
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/route_path.dart';




void launchScan(BuildContext context) {
    LocalChannel.startScan();
}


void launchWriteOff(String code){
   LocalChannel.startRouteActivity(writeOff,{"url":code});
}