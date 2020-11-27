import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/ui/goods/goods_details_page.dart';

import 'file:///D:/dev/workspaces2/worldfunclub/lib/local_platform_channel.dart';
import 'package:worldfunclub/ui/order/order_list_page.dart';

void launchGoodsDetails(BuildContext context, String goodsId,
    {bool useFlutter = true, GoodsType type = GoodsType.self}) {
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

void launchOrderList(BuildContext context, int orderState, GoodsType type,
    {bool useFlutter = false}) {
  if (useFlutter) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (c) => OrderListPage(
              goodsType: type,
              state: orderState,
            )));
  } else {
    if (type == GoodsType.self) {
      LocalChannel.startRouteActivity(
          orderList, {"state": orderState.toString()});
    } else {
      LocalChannel.startRouteActivity(
          orderListLive, {"state": orderState.toString()});
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
  } else {
    LocalChannel.startRouteActivity(businessBackground, {});
  }
}

void launchGoodsCategoryLevelLast(BuildContext context, HomeCategoryData cid,
    {bool useFlutter = false, GoodsType type = GoodsType.self}) {
  if(useFlutter){

  }else{
    LocalChannel.startRouteActivity(lastCategory, {"category2":jsonEncode(cid.toJson())});
  }
}
