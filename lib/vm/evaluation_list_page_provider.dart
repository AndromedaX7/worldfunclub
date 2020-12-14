import 'package:worldfunclub/bean/goods_details_bean.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
class EvaluationListPageProvider extends BaseProvider with LoadMoreMixin {
  final String _goodsId;
  EvaluationListPageProvider(this._goodsId);
  int _selected = 0;

  int get selected => _selected;

  set selected(int sel) {
    _selected = sel;
    notifyListeners();
  }

  List<String> type = ["all", "picture", "praise", "review", "negative"];

  int _all = 0;
  int _picture = 0;
  int _praise = 0;
  int _review = 0;
  int _negative = 0;

  int get all => _all;

  int get picture => _picture;

  int get praise => _praise;

  int get review => _review;

  int get negative => _negative;

  set all(int count) {
    _all = count;
    notifyListeners();
  }

  set picture(int count) {
    _picture = count;
    notifyListeners();
  }

  set praise(int count) {
    _praise = count;
    notifyListeners();
  }

  set review(int count) {
    _review = count;
    notifyListeners();
  }

  set negative(int count) {
    _negative = count;
    notifyListeners();
  }

  List<CommentDataList> _list = [];

  List<CommentDataList> get list => _list;

  set list(List<CommentDataList> ll) {
    _list.addAll(ll);
    notifyListeners();
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    request(api.loadEvaluationList(_goodsId, type[selected], page), (json) {
      var resp = CommentResp.fromJson(json);
      canload = (resp.code == 1 && resp.data.list.length >= 0);
      if (resp.code == 1) {
        if (clearData) {
          list.clear();
        }
        list = resp.data.list;
        all=resp.data.all.integer;
        picture=resp.data.picture.integer;
        praise=resp.data.praise.integer;
        review=resp.data.review.integer;
        negative=resp.data.negative.integer;
      }
    });
  }

  void loadEvaluation({bool clearData = false}) {
    loadMore(clearData: clearData);
  }
}
