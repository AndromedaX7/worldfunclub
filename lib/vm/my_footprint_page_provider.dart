import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class MyFootprintPageProvider extends BaseProvider  with LoadMoreMixin{
  List<FootprintData> _data = [];

  List<FootprintData> get data => _data;

  set data( List<FootprintData> fp){
    _data.addAll(fp);
    notifyListeners();
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData:clearData);
    api.footprint(page).listen((event) {
      var resp = FootprintResp.fromJson(event);
      canload=resp.code == 1&&resp.data.length>0;
      if(resp.code == 1){
        if(clearData){
          data.clear();
        }
        data=resp.data;
      }
    });
  }
  void footprint({bool clearData = false}) {
   loadMore(clearData: clearData);
  }

  void deleteFootPrint(FootprintContent content) {
    api.deleteFootPoint(content.visitId).listen((event) {
      var resp = EmptyDataResp.fromJson(event);
      if(resp.code== 1){
        Fluttertoast.showToast(msg: "删除成功");
      }else{
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }
}
