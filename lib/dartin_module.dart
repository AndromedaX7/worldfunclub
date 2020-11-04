import 'package:dartin/dartin.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

final appModule=[viewModelModule];

final viewModelModule=Module([
  single<MainUiProvider>(({params})=>MainUiProvider()),
  factory<HomeMainPageProvider>(({params})=>HomeMainPageProvider()),
]);

initDartIn()async{
  startDartIn(appModule);
}