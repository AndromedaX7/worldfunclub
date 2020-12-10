import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/merchant/balance_background_page.dart';

void launchWithdraw(BuildContext context  ) {
    LocalChannel.startRouteActivity(withdraw, {"shopString":"true"});
}



void launchScan(BuildContext context) {
    LocalChannel.startScan();
}


void launchWriteOff(String code){
   LocalChannel.startRouteActivity(writeOff,{"url":code});
}