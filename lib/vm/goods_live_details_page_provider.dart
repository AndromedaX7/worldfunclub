import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class GoodsLiveDetailsPageProvider extends BaseProvider {
  final String goodsId;
  final bool self;

  LiveGoodsDetailsData _data;

  LiveGoodsDetailsData get data => _data;

  set data(LiveGoodsDetailsData d) {
    _data = d;
    notifyListeners();
  }

  List<LiveGoodsItemMapping> _skuList = [];

  List<LiveGoodsItemMapping> get skuList => _skuList;

  set skuList(List<LiveGoodsItemMapping> sl) {
    this._skuList = sl;
    notifyListeners();
  }

  GoodsLiveDetailsPageProvider(this.goodsId, this.self) {
    _data = LiveGoodsDetailsData();
    _data.shopInfo = LiveShopInfo();
    _data.goods_images = [];
  }

  void goodsDetails() {
    api.liveGoodsDetails(goodsId).listen((event) {
      var resp = LiveGoodsDetailsResp.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
        if (data.spec_attr.length > 0) {
          skuList = List<LiveGoodsItemMapping>.generate(
              data.sku_list.length,
              (index) => LiveGoodsItemMapping.most(data.sku_list[index], data,
                  data.spec_attr[0], data.spec_attr[0].spec_items[index]));
        } else {
          skuList = List<LiveGoodsItemMapping>.generate(
              data.sku_list.length,
              (index) => LiveGoodsItemMapping.single(
                    data.sku_list[index],
                    data,
                  ));
        }
      }
    });
  }
}
