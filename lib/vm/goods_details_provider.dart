import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/cart_list.dart';
import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/order_create_page.dart';
import 'package:worldfunclub/utils/log.dart';

class GoodsDetailsPageProvider extends BaseProvider {
  String _goodsId;
  String _html = "[]";
  String _price = "0.00";
  String _linePrice = "0.00";
  String _sales = "0";
  int goodsStock = 0;
  int commentCount = 0;

  int propCount = 1;

  String skuId;
  GoodsData goodsData;

  String get sales => _sales;
  bool _collection = false;
  List<SkuListBean> propSKUArray = [];

  List<SpecItemsBean> propArray = [];

  String _hasSelectedPropName = "";

  String get hasSelectedPropName => _hasSelectedPropName;

  set hasSelectedPropName(String s) {
    _hasSelectedPropName = s;
    notifyListeners();
  }

  List<SpecAttrBean> _attrs = [];

  List<SpecAttrBean> get attrs => _attrs;

  set attrs(List<SpecAttrBean> attr) {
    _attrs = attr;
    notifyListeners();
  }

  set collection(bool cl) {
    _collection = cl;
    notifyListeners();
  }

  bool get collection => _collection;

  set sales(String sales) {
    _sales = sales;
    notifyListeners();
  }

  String get linePrice => _linePrice;

  set linePrice(String lp) {
    _linePrice = lp;
    notifyListeners();
  }

  String get price => _price;

  set price(String price) {
    _price = price;
    notifyListeners();
  }

  String get html => _html;

  set html(String details) {
    _html = details;
    notifyListeners();
  }

  bool supportNativeComponent() {
    String native = html
        .replaceAll(" ", "")
        .replaceFirst("<p><imgsrc=", "[")
        .replaceAll("</ul>", "")
        .replaceAll("</li>", "")
        .replaceAll("<ul>", "")
        .replaceAll("<li>", "")
        .replaceAll("imgsrc=", ",")
        .replaceAll("<br/>", "")
        .replaceAll("</p><p>", "")
        .replaceAll("<p></p>", "")
        .replaceFirst("/></p>", "]")
        .replaceAll("/><,", ",");
    try {
      var decode = jsonDecode(native);
      bool support = decode is List<dynamic>;
      if (support) {
        nativeComponent = List.generate((decode as List<dynamic>).length,
            (index) => (decode as List<dynamic>)[index].toString());
      }
      return support;
    } catch (e) {
      Log.e(e);
      Log.d(native);
      return false;
    }
  }

  List<String> nativeComponent = [];

  List<String> _images = List();

  List<String> get images => _images;

  set images(List<String> imgs) {
    _images = imgs;
    notifyListeners();
  }

  GoodsDetailsPageProvider(this._goodsId);

  String _goodsName = "";

  String get goodsName => _goodsName;

  set goodsName(gName) {
    _goodsName = gName;
    notifyListeners();
  }

  void goodsDetails() {
    api.goodsDetails(_goodsId).listen((event) {
      var bean = GoodsDetailsBean.fromJson(event);
      if (bean.code == 1) {
        var data = bean.data;
        parseGoodsDetails(data);
      }
    });
  }

  void parseGoodsDetails(GoodsData data) {
    goodsData = data;
    goodsName = data.goodsName;
    images = data.goodsImages;
    html = data.content;
    // sales = data.goods_sales;
    propSKUArray = data.sku_list;
    collection = data.collected_status == "2";
    if (propSKUArray.isNotEmpty) {
      price = propSKUArray[0].goods_price;
      linePrice = propSKUArray[0].line_price;
      sales = propSKUArray[0].goods_sales;
      goodsStock = propSKUArray[0].stock_num.integer;
      commentCount = data.comment_data_count.integer;
      skuId = propSKUArray[0].goods_sku_id;
    }

    attrs = data.spec_attr;
    attrs.forEach((element) {
      propArray.add(element.spec_items[0]);
    });

    _toPropName(propArray);
    _computePropVersion1();
  }

  void _toPropName(List<SpecItemsBean> data) {
    if (data.isEmpty) {
      // linePrice = marketGoodsPrice
      skuGoodsPrice = price;
    } else {
      var propName = "";
      for (SpecItemsBean i in data) {
        propName += i.spec_value;
        propName += "  ";
      }
      hasSelectedPropName = propName;
    }
  }

  void _computePropVersion1() {
    SkuListBean skuSelected;
    for (SkuListBean sku in propSKUArray) {
      var propCount = 0;
      var allIds = sku.spec_sku_id.split("_");
      for (SpecItemsBean prop in propArray) {
        if (allIds.contains(prop.item_id)) {
          propCount++;
        }
      }

      if (propCount == propArray.length) {
        skuSelected = sku;
        skuId = sku.goods_sku_id;
        break;
      }
    }
    if (skuSelected != null) {
      skuGoodsCount = skuSelected.stock_num;
      skuGoodsImage = skuSelected.image;
      skuGoodsPrice = skuSelected.goods_price;
      // skuGoodsMarketPrice = skuSelected.line_price;
    }
  }

  String _skuGoodsImage = "";

  String get skuGoodsImage => _skuGoodsImage;

  set skuGoodsImage(String s) {
    _skuGoodsImage = s;
    notifyListeners();
  }

  String _skuGoodsPrice = "";

  String get skuGoodsPrice => _skuGoodsPrice;

  set skuGoodsPrice(String s) {
    _skuGoodsPrice = s;
    notifyListeners();
  }

  String skuGoodsCount = "0";

  void changeProp(state) {
    propArray.clear();
    attrs.forEach((element) {
      propArray.add(element.spec_items[element.selected]);
    });
    _toPropName(propArray);
    _computePropVersion1();
  }

  void addCart() {
    api.addCart(goodsData.goodsId, propCount, skuId).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if (resp.code == 1) {
        Fluttertoast.showToast(msg: "添加成功");
      } else {
        Fluttertoast.showToast(msg: "${resp.msg}");
      }
    });
  }

  void buyNow(BuildContext context) {
    var goods = GoodsListBean.fromGoodsDetails(goodsData, skuGoodsImage,
        skuGoodsPrice, skuId, hasSelectedPropName, propCount);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (builder) => OrderCreatePage(
              [goods],
              cart: false,
            )));
  }
}
