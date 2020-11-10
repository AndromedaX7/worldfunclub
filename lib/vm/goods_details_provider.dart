import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/http/network.dart';

class GoodsDetailsPageProvider extends BaseProvider {
  String _goodsId;
  String _html="";
  String _price="0.00";
  String _sales="0";
  String get sales=> _sales;
  set sales (String sales){
    _sales=sales;
    notifyListeners();
  }
  String get price =>_price;
  set price (String price){
    _price=price;
    notifyListeners();
  }

  String get  html =>_html;
  set html (String details){
    _html= details;
    notifyListeners();
  }
  List<String> _images=List();

  List<String> get images=>_images;
  set images(List<String> imgs){
    _images=imgs;
    notifyListeners();
  }
  GoodsDetailsPageProvider(this._goodsId);

  String _goodsName="";
  String get goodsName =>_goodsName;
  set goodsName(gName){
    _goodsName=gName;
    notifyListeners();
  }

  void goodsDetails() {
    api.goodsDetails(_goodsId).listen((event) {
      var bean =GoodsDetailsBean.fromJson(event);
      if(bean .code ==1 ){
        var data = bean.data;
        goodsName=data.goods_name;
        images=data.goods_images;
        html=data.content;
        sales= data.goods_sales;
      }

    });
  }
}
