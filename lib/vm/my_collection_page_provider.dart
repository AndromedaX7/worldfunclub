import 'package:worldfunclub/bean/mine.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/load_more_minix.dart';

class MyCollectionPageProvider extends BaseProvider with LoadMoreMixin {
  List<CollectionData> _collection = [];

  List<CollectionData> get collection => _collection;

  set collection(List<CollectionData> col) {
    _collection.addAll(col);
    notifyListeners();
  }

  void collectionList({bool clearData = false}) {
    loadMore(clearData: clearData);
  }

  @override
  void loadMore({bool clearData = false}) {
    super.loadMore(clearData: clearData);
    api.getCollectList(page).listen((event) {
      var resp = CollectionListResp.fromJson(event);
      canload = resp.code == 1;
      if (resp.code == 1) {
        if (clearData) {
          collection.clear();
        }
        collection = resp.data;
      }
    });
  }

  void deleteCollection(CollectionData data) {
    String collectionId = data.collect_id;
    collection.removeWhere((element) => element == data);
    api.deleteCollection(collectionId).listen((event) {});
  }
}
