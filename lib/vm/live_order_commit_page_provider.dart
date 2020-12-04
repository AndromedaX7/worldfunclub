import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
class LiveOrderCommitPageProvider extends BaseProvider {
  final LiveGoodsItemMapping data;
  final String hours;
  final String shopName;

  int _totalCount = 1;

  int get totalCount => _totalCount;

  set totalCount(int i) {
    _totalCount = i;
    notifyListeners();
  }


  void increaseCartNum(
      bool orientation, ) {

    if (orientation) {
      if (totalCount >= data.sku.stock_num.integer) {
        return;
      } else {
        totalCount = totalCount+1;
      }
    } else {
      if (totalCount <= 1) {
        return;
      } else {
        totalCount=  totalCount - 1 ;
      }
    }
  }

  int hour=0;
  int minute=0;
  int endHour=0;
  int endMinute=0;

  LiveOrderCommitPageProvider(this.shopName, this.hours,this.data) {
    var times = hours.split("-");
    if(times.length>1){
      var start = times[0].split(":");
      var end = times[1].split(":");
      hour=start[0].integer;
      minute=start[1].integer;
      endHour=end[0].integer;
      endMinute=end[1].integer;
    }
  }
}
