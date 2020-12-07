import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/merchant/balance_background_page.dart';

void launchBusinessBackground(BuildContext context, {bool useFlutter = false}) {
  if (useFlutter) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (builder) => BalanceBackgroundPage()));
  } else {
    LocalChannel.startRouteActivity(businessBackground, {});
  }
}

void launchGoodsCategoryLevelLast(BuildContext context, HomeCategoryData cid,
    {bool useFlutter = false, GoodsType type = GoodsType.self}) {
  if (useFlutter) {
  } else {
    LocalChannel.startRouteActivity(
        lastCategory, {"category2": jsonEncode(cid.toJson())});
  }
}
