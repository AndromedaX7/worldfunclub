import 'package:dartin/dartin.dart';
import 'package:worldfunclub/ui/home/live/live_category_page.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';
import 'package:worldfunclub/vm/home_category_other_provider.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/vm/live_category_page_provider.dart';
import 'package:worldfunclub/vm/live_page_provider.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

final appModule=[viewModelModule];

final viewModelModule=Module([
  single<MainUiProvider>(({params})=>MainUiProvider()),
  factory<HomeMainPageProvider>(({params})=>HomeMainPageProvider()),
  factory<HomeCategoryHomePageProvider>(({params})=>HomeCategoryHomePageProvider()),
  factory<HomeCategoryOtherPageProvider>(({params})=>HomeCategoryOtherPageProvider(params.get(0))),
  factory<LivePageProvider>(({params})=>LivePageProvider()),
  factory<LiveCategoryPageProvider>(({params})=>LiveCategoryPageProvider(params.get(0))),

  // factory<BannerPageProvider>(({params})=>BannerPageProvider(params.get(0),params.get(1)))
]);

initDartIn()async{
  startDartIn(appModule);
}