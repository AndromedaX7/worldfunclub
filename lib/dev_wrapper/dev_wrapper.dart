import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/order/order_list.dart';
import 'package:worldfunclub/other.dart';
import 'package:worldfunclub/route_path.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/ui/goods/goods_details_page.dart';
import 'package:worldfunclub/widgets/local_platform_channel.dart';

void launchGoodsDetails(BuildContext context, String goodsId,
    {bool useFlutter = true}) {
  if (useFlutter) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (c) => GoodsDetailsPage(goodsId)));
  } else {
    LocalChannel.startRouteActivity(goodsDetailsActivity, {"goodsId": goodsId});
  }
}

void launchOrderList(BuildContext context, int orderState,GoodsType type,
    {bool useFlutter = false}) {
    if(useFlutter){
      Navigator.of(context) .push(MaterialPageRoute(builder: (c)=>OrderListPage(goodsType: type,state: orderState,)));
    }else{
      if(type ==GoodsType.self){
        LocalChannel.startRouteActivity(orderList, {"state":orderState.toString()});
      }else{
        LocalChannel.startRouteActivity(orderListLive, {"state":orderState.toString()});
      }
    }
}

void launchCart(BuildContext context, {bool useFlutter = false}){
  if(useFlutter ){
    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>CartPage()));
  }else{
    LocalChannel.startRouteActivity(cartActivity, {});
  }
}


void launchBusinessBackground(BuildContext context,{bool useFlutter =false}){
  if(useFlutter){

  }else{
    LocalChannel.startRouteActivity(businessBackground, {});
  }
}
