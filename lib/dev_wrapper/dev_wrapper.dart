import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/ui/goods/goods_details_page.dart';
import 'package:worldfunclub/ui/merchant/balance_background_page.dart';

void launchGoodsDetails(BuildContext context, String goodsId,
    {bool useFlutter = false, GoodsType type = GoodsType.self}) {
  if (useFlutter) {
    if (type == GoodsType.self) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => GoodsDetailsPage(goodsId)));
    } else {}
  } else {
    if (type == GoodsType.self) {
      LocalChannel.startRouteActivity(
          goodsDetailsActivity, {"goodsId": goodsId});
    } else {
      LocalChannel.startRouteActivity(delicacyDetails, {"goodsId": goodsId});
    }
  }
}

void launchCart(BuildContext context, {bool useFlutter = false}) {
  if (useFlutter) {
    Navigator.of(context).push(MaterialPageRoute(builder: (c) => CartPage()));
  } else {
    LocalChannel.startRouteActivity(cartActivity, {});
  }
}

void launchBusinessBackground(BuildContext context, {bool useFlutter = false}) {
  if (useFlutter) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BalanceBackgroundPage()));
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
