import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/providers.dart';

class HomeCategoryHomePageProvider extends BaseProvider{
  List<BannerData> _bannerList = List();
  List<BannerData> _bannerList2 = List();
  List<HomeCategoryGoods> _goods = List();
  List<HomeCategoryGoods> _goods2 = List();

  void banner(){
    // api.banner("99999", "1").listen((event) {
    //   var bannerBean = BannerBean.fromJson(event);
    //   if (bannerBean.code == 1) {
    //     setState(() {
    //       bannerList.addAll(bannerBean.data);
    //     });
    //   }
    // });
    // api.banner("99999", "2").listen((event) {
    //   var bannerBean = BannerBean.fromJson(event);
    //   if (bannerBean.code == 1) {
    //     setState(() {
    //       bannerList2.addAll(bannerBean.data);
    //     });
    //   }
    // });
    // api.categoryGoods("99999", true,  "2",1).listen((event) {
    //   var bean = HomeCategoryGoodsBean.fromJson(event);
    //   if (bean.code == 1) {
    //     setState(() {
    //       goods.addAll(bean.data);
    //     });
    //   }
    // });
    // api.categoryGoods("99999", true,"1", 1).listen((event) {
    //   var bean = HomeCategoryGoodsBean.fromJson(event);
    //   if (bean.code == 1) {
    //     setState(() {
    //       goods2.addAll(bean.data);
    //     });
    //   }
  }
}