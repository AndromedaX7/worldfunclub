class LoadMoreMixin {
  bool canload = false;
  int page = 0;

  void loadMore({bool clearData = false}) {
    if (clearData) {
      page = 1;
    } else
      page++;
  }
}
