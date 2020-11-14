import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class GoodsDetailsPageProvider extends BaseProvider {
  String _goodsId;
  String _html = "";
  String _price = "0.00";
  String _linePrice = "0.00";
  String _sales = "0";
  int goodsStock = 0;
  int commentCount = 0;
  String skuId;

  String get sales => _sales;
  bool _collection = false;

  set collection(bool cl) {
    _collection = cl;
    notifyListeners();
  }

  bool get collection=>_collection;

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
        goodsName = data.goods_name;
        images = data.goods_images;
        html = data.content;
        // sales = data.goods_sales;
        var propSkuArray = data.sku_list;
        collection = data.collected_status == "2";
        if (propSkuArray.isNotEmpty) {
          price = propSkuArray[0].goods_price;
          linePrice = propSkuArray[0].line_price;
          sales = propSkuArray[0].goods_sales;
          goodsStock = propSkuArray[0].stock_num.integer;
          commentCount = data.comment_data_count.integer;
          skuId = propSkuArray[0].goods_sku_id;
        }
      }
    });
  }
}
