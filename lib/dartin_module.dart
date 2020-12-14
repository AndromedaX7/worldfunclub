import 'package:dartin/dartin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/local_platform_channel.dart';
import 'package:worldfunclub/vm/add_bank_card_page_provider.dart';
import 'package:worldfunclub/vm/address_list_page_provider.dart';
import 'package:worldfunclub/vm/after_sale_details_page_provider.dart';
import 'package:worldfunclub/vm/after_sale_list_page_provider.dart';
import 'package:worldfunclub/vm/after_sale_page_provider.dart';
import 'package:worldfunclub/vm/after_sale_service_select_page_provider.dart';
import 'package:worldfunclub/vm/balance_background_page_provider.dart';
import 'package:worldfunclub/vm/balance_page_provider.dart';
import 'package:worldfunclub/vm/bind_phone_page_provider.dart';
import 'package:worldfunclub/vm/cart_page_provider.dart';
import 'package:worldfunclub/vm/checkout_counter_page_provider.dart';
import 'package:worldfunclub/vm/club_page_provider.dart';
import 'package:worldfunclub/vm/evaluation_page_provider.dart';
import 'package:worldfunclub/vm/express_page_provider.dart';
import 'package:worldfunclub/vm/goods_category_last_page_provider.dart';
import 'package:worldfunclub/vm/goods_category_page_provider.dart';
import 'package:worldfunclub/vm/goods_details_provider.dart';
import 'package:worldfunclub/vm/goods_live_details_page_provider.dart';
import 'package:worldfunclub/vm/goods_search_page_provider.dart';
import 'package:worldfunclub/vm/home_advert_page_provider.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';
import 'package:worldfunclub/vm/home_category_other_provider.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/vm/live_category_page_provider.dart';
import 'package:worldfunclub/vm/live_order_commit_page_provider.dart';
import 'package:worldfunclub/vm/live_page_provider.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/login_page_provider.dart';
import 'package:worldfunclub/vm/login_phone_provider.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';
import 'package:worldfunclub/vm/mine_page_provider.dart';
import 'package:worldfunclub/vm/my_collection_page_provider.dart';
import 'package:worldfunclub/vm/my_coupon_page_provider.dart';
import 'package:worldfunclub/vm/my_footprint_page_provider.dart';
import 'package:worldfunclub/vm/order_category_page_provider.dart';
import 'package:worldfunclub/vm/order_create_page_provider.dart';
import 'package:worldfunclub/vm/order_details_page_provider.dart';
import 'package:worldfunclub/vm/pay_success_page_provider.dart';
import 'package:worldfunclub/vm/permission_handler_page_provider.dart';
import 'package:worldfunclub/vm/search_page_provider.dart';
import 'package:worldfunclub/vm/security_change_phone_page_provider.dart';
import 'package:worldfunclub/vm/settings_provider.dart';
import 'package:worldfunclub/vm/vip_page_provider.dart';
import 'package:worldfunclub/vm/withdraw_page_provider.dart';
import 'package:worldfunclub/vm/withdraw_record_list_page_provider.dart';
import 'package:worldfunclub/vm/write_off_page_provider.dart';

final appModule = [viewModelModule, localModule];

final localModule = Module([
  single<LocalCache>(({params}) => LocalCache(_preferences)),
  single<Api>(({params}) => api),
  factory<LocalChannel>(({params}) => LocalChannel()),
]);

final viewModelModule = Module([
  single<MainUiProvider>(({params}) => MainUiProvider(get())),
  factory<LoginPageProvider>(
      ({params}) => LoginPageProvider(get(), get(), get())),
  factory<LoginPhonePageProvider>(
      ({params}) => LoginPhonePageProvider(get(), get())),
  factory<HomeMainPageProvider>(({params}) => HomeMainPageProvider()),
  factory<HomeCategoryHomePageProvider>(
      ({params}) => HomeCategoryHomePageProvider()),
  factory<HomeCategoryOtherPageProvider>(
      ({params}) => HomeCategoryOtherPageProvider(params.get(0))),
  factory<LivePageProvider>(({params}) => LivePageProvider()),
  factory<LiveCategoryPageProvider>(
      ({params}) => LiveCategoryPageProvider(params.get(0))),
  factory<GoodsDetailsPageProvider>(
      ({params}) => GoodsDetailsPageProvider(params.get(0))),
  factory<CartPageProvider>(({params}) => CartPageProvider()),
  factory<VipPageProvider>(({params}) => VipPageProvider()),
  factory<SettingsPageProvider>(
      ({params}) => SettingsPageProvider(get(), get())),
  factory<MinePageProvider>(({params}) => MinePageProvider()),
  factory<BalancePageProvider>(
      ({params}) => BalancePageProvider(params.get(0))),
  factory<ClubPageProvider>(({params}) => ClubPageProvider()),
  factory<GoodsCategoryPageProvider>(({params}) => GoodsCategoryPageProvider()),
  factory<HomeAdvertPageProvider>(({params}) =>
      HomeAdvertPageProvider(params.get(0), params.get(1), params.get(2))),
  factory<AddressListPageProvider>(
      ({params}) => AddressListPageProvider(params.get(0))),
  factory<PaySuccessPageProvider>(({params}) => PaySuccessPageProvider(
        params.get(0),
        params.get(1),
        params.get(2),
      )),
  factory<GoodsSearchPageProvider>(
      ({params}) => GoodsSearchPageProvider(params.get(0), params.get(1))),
  factory<GoodsCategoryLastPageProvider>(
      ({params}) => GoodsCategoryLastPageProvider(params.get(0))),
  factory<MyCollectionPageProvider>(({params}) => MyCollectionPageProvider()),
  factory<MyCouponPageProvider>(({params}) => MyCouponPageProvider()),
  factory<MyFootprintPageProvider>(({params}) => MyFootprintPageProvider()),
  factory<AfterSalePageProvider>(({params}) => AfterSalePageProvider()),
  factory<OrderCategoryPageProvider>(
      ({params}) => OrderCategoryPageProvider(params.get(0), params.get(1))),
  factory<SearchPageProvider>(({params}) => SearchPageProvider()),
  factory<CheckoutCounterPageProvider>(
      ({params}) => CheckoutCounterPageProvider(params.get(0), params.get(1))),

  factory<OrderDetailsPageProvider>(
      ({params}) => OrderDetailsPageProvider(params.get(0), params.get(1))),
  factory<OrderCreatePageProvider>(
      ({params}) => OrderCreatePageProvider(params.get(0), params.get(1))),
  factory<GoodsLiveDetailsPageProvider>(
      ({params}) => GoodsLiveDetailsPageProvider(params.get(0), params.get(1))),
  factory<AfterSaleServiceSelectPageProvider>(
      ({params}) => AfterSaleServiceSelectPageProvider(params.get(0))),
  factory<AfterSaleListPageProvider>(
      ({params}) => AfterSaleListPageProvider(params.get(0))),
  factory<LiveOrderCommitPageProvider>(({params}) =>
      LiveOrderCommitPageProvider(params.get(0), params.get(1), params.get(2))),
  factory<BalanceBackgroundPageProvider>(({params}) =>
      BalanceBackgroundPageProvider(
          /*params.get(0),params.get(1),params.get(2)*/)),
  factory<SecurityChangePhonePageProvider>(
      ({params}) => SecurityChangePhonePageProvider(get())),
  factory<AfterSaleDetailsPageProvider>(
      ({params}) => AfterSaleDetailsPageProvider(params.get(0), params.get(1))),
  factory<ExpressPageProvider>(
      ({params}) => ExpressPageProvider(params.get(0), params.get(1))),
  factory<EvaluationPageProvider>(
      ({params}) => EvaluationPageProvider(params.get(0), params.get(1) )),
  factory<BindPhonePageProvider>(
      ({params}) => BindPhonePageProvider(get(),get())),
  factory<WithdrawPageProvider>(
      ({params}) => WithdrawPageProvider()),
  factory<WithdrawRecordListPageProvider>(
      ({params}) => WithdrawRecordListPageProvider()),
  factory<AddBankCardPageProvider>(
      ({params}) => AddBankCardPageProvider()),
  factory<PermissionHandlerPageProvider>(
      ({params}) => PermissionHandlerPageProvider()),
  factory<WriteOffPageProvider>(
      ({params}) => WriteOffPageProvider(params.get(0))),
  // factory<BannerPageProvider>(({params})=>BannerPageProvider(params.get(0),params.get(1)))
]);

Future initDartIn() async {
  _preferences = await SharedPreferences.getInstance();
  startDartIn(appModule);
}

SharedPreferences _preferences;
