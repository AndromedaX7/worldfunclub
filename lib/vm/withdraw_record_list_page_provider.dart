import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

import 'load_more_minix.dart';

class WithdrawRecordListPageProvider extends BaseProvider with LoadMoreMixin {
  List<WithdrawRecordListData> _data = [];

  List<WithdrawRecordListData> get data => _data;

  set data(List<WithdrawRecordListData> bl) {
    _data.addAll(bl);
    notifyListeners();
  }

  void loadList({bool clearData = false}) {
    if (clearData) {
      page = 0;
    }
    loadMore(clearData: canload);
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.withdrawRecord(page).listen((event) {
      var resp = WithdrawRecordListResp.fromJson(event);
      canload = resp.code == 1 && resp.data.length > 0;
      if (resp.code == 1) {
        if (clearData) {
          data.clear();
        }
        data = resp.data;
      }
    });
  }
}
