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
    _data.goodsImages = [];
  }

  void goodsDetails() {
    api.liveGoodsDetails(goodsId).listen((event) {
      var resp = LiveGoodsDetailsResp.fromJson(event);
      if (resp.code == 1) {
        data = resp.data;
        if (data.specAttr.length > 0) {
          skuList = List<LiveGoodsItemMapping>.generate(
              data.skuList.length,
              (index) => LiveGoodsItemMapping.most(data.skuList[index], data,
                  data.specAttr[0], data.specAttr[0].specItems[index]));
        } else {
          skuList = List<LiveGoodsItemMapping>.generate(
              data.skuList.length,
              (index) => LiveGoodsItemMapping.single(
                    data.skuList[index],
                    data,
                  ));
        }
      }
    });
  }
}
