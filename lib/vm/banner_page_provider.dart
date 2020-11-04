import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class BannerPageProvider extends BaseProvider {
  final String _categoryId;
  final String _rotationType;

  List<BannerData> _data = List();
  List<BannerData> get data=>_data;
  set data(List<BannerData> data){
    _data.clear();
    _data.addAll(data);
    notifyListeners();
  }
  BannerPageProvider(this._categoryId, this._rotationType);

  void banner() {
    api.banner(_categoryId, _rotationType).listen((event) {
      var bannerBean = BannerBean.fromJson(event);
      if (bannerBean.code == 1) {
        data=bannerBean.data;
      }
    });
  }
}
