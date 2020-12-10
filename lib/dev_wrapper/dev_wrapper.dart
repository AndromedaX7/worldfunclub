
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/home/mine/withdraw_page.dart';

void launchWithdraw(BuildContext context  ) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>WithdrawPage()));
}



void launchScan(BuildContext context) {
    LocalChannel.startScan();
}


void launchWriteOff(String code){
   LocalChannel.startRouteActivity(writeOff,{"url":code});
}