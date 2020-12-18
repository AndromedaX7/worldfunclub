# 环球途乐会
## Android文档参见[这里](https://gitee.com/Tokra/WorldFunClub-Android/blob/master/README.md)
## 关于App

基于flutter高效绘制引擎（并未使用其跨平台特性），提升其绘制ui效率。提升App运行流畅度。舍弃原生canvas绘制，告别java带来的额外开销。通过dart aot
编译技术，直接编译为可预知机器语言。保证稳定性和其高达120Hz(看硬件支持)绘制及运行效率

## 关于仓库分支

* master 呈现最新改动，进行测试等。
* dev 呈现为master测试通过内容 可进一步测试。
* beta 呈现为dev测试通过内容。
* stable 呈现为beta测试通过内容
* web 实现在浏览器上玩耍的玩具。问题在于适配。 

**master**分支已完成测试，其他(除web)分支待合并。

## 依赖

* _**dio: ^3.0.10**_ 用于网络请求
* **_json_annotation_**:json解析
* **_rxdart: ^0.21.0_** 提供更便捷的异步操作。不知道？ rxjava总知道吧
* **_fluttertoast: ^7.1.1_** 调用Toast吧 作者应该有比较猛的功能，没用到
* **_flutter_swiper: ^1.1.6_** 轮播图，支持各种形式的轮播图
* **_provider: ^4.3.2+2_** 状态管理界的基层大佬吧，flutter官方提供
* **_dartin: ^0.1.0_** 用于依赖注入，类似于Dagger2，比其轻便简单！
* **_shared_preferences: ^0.5.12+4_** Android的SharedPreferences ios 对应实现 web也支持的插件
* **_flutter_inappwebview: ^4.0.0+4_** WebView的技术解决方案，虽说也是套娃。但是人家套的好
* **_flutter_rating_bar: ^3.2.0+1_** 宁给几颗星？
* **_image_pickers: ^1.0.8+7_** 图片选择器，视频、图片、照相、多张均可
* **_permission_handler: ^5.0.1+1_** Android Api23+ 你懂的
* **_worldfunclublocal_** 实现扫码，打开任意协议url,微信登录，微信支付，打开地图。详寻[10086](https://github.com/AndromedaX7/worldfunclublocal)   
### 上述依赖及文档均可在[**_这里找到_**](https://pub.dev/) (除了worldfunclublocal)

## 关于结构
* [_**android**_](android) android原生代码部分，不过只有一些权限声明和组件声明，值得注意的是如果要介入sharesdk,只需取消[build.gradle](android/app/build.gradle) 第27行注释 ,即 **apply from: "mob.gradle"**。
* [_**assets**_](assets) 只有一个省市区联动的数据，来自后端。
* [_**images**_](images) 用到的资源。关于[2.0x](images/2.0x)和[3.0x](images/3.0x)请向ios开发人员请教，他们更了解。
* [_**ios**_](ios) 跨平台ios客户端代码，至于里面还有啥，不知道。我啥也没放。(可以考虑和ios开发人员合作...)
* [_**lib**_](lib) 项目实现。
* [_**linux**_](linux) linux客户端，除微信不能用之外，请自行适配字体问题和webview。
* [_**test**_](test) 用于测试。多用于单元测试。
* [_**web**_](web) html版本的。参见分支[web](https://github.com/AndromedaX7/worldfunclub/tree/web)
* [pubspec.yaml](pubspec.yaml) 配置文件 意义同 AndroidManifest.xml和 build.gradle

## 关于[lib](lib)
* [bean](lib/bean) Http相应数据。
* [extension](lib/extensions) 扩展函数及运算符重载
* [http](lib/http) 网络请求
* [settings](lib/settings) 提供设置中部分功能，不一定用得上。
* [ui](lib/ui) 各个界面
* [utils](lib/utils) 有用的工具（只有一个log工具）
* [vm](lib/vm) ui的逻辑模型
* [widgets](lib/widgets) 有用的组件
* [dartin_module.dart](lib/dartin_module.dart) 依赖注入的配置清单
* [design.dart](lib/design.dart) 屏幕适配还是要有的
* [local_platform_channel.dart](lib/local_platform_channel.dart) 调用本地代码的包装类，其功能已实现于[worldfunclublocal](https://github.com/AndromedaX7/worldfunclublocal)
* [main.dart](lib/main.dart) 不必多说，我们的故事从这里开始！
* [other.dart](lib/other.dart) 定义了一些可枚举的常量。
* [providers.dart](lib/providers.dart) 状态管理的封装和关联

## 关于Ui和文件的对应关系(点击查看文件详情)
* [收件地址列表](lib/ui/address/address_list_page.dart)
* [编辑地址](lib/ui/address/modify_address_page.dart)
* [我的余额](lib/ui/balance/balance_page.dart)
* [购物车](lib/ui/goods/cart_page.dart)
* [评价列表](lib/ui/goods/evaluation_list_page.dart)
* [最后一级商品分类](lib/ui/goods/goods_category_last_page.dart)
* [商品分类](lib/ui/goods/goods_category_page.dart)
* [商品详情](lib/ui/goods/goods_details_page.dart)
* [乐活商品详情](lib/ui/goods/goods_live_details_page.dart)
* [通用商品搜索页](lib/ui/goods/goods_search_page.dart)
* [首页](lib/ui/home/home_page.dart)
* [首页各分类1](lib/ui/home/home/home_category_home_page.dart)
* [首页各分类2](lib/ui/home/home/home_category_other_page.dart)
* [社区](lib/ui/home/club/club_page.dart)
* [首页活动（京东等）](lib/ui/home/home/home_advert_page.dart)
* [乐活/本地](lib/ui/home/live/live_page.dart)
* [我的](lib/ui/home/mine/mine_page.dart)
* [售后详情](lib/ui/home/mine/after_sale_details_page.dart)
* [售后列表](lib/ui/home/mine/after_sale_page.dart)
* [申请售后页](lib/ui/home/mine/after_sale_sevice_select_page.dart)
* [发起评价](lib/ui/home/mine/evaluation_page.dart)
* [物流](lib/ui/home/mine/express_page.dart)
* [我的收藏](lib/ui/home/mine/my_collection_page.dart)
* [我的优惠券](lib/ui/home/mine/my_coupon_page.dart)
* [我的足迹](lib/ui/home/mine/my_footprint_page.dart)
* [会员](lib/ui/home/vip/vip_page.dart)
* [我的会员](lib/ui/home/vip/my_vip_page.dart)
* [我的收益](lib/ui/home/vip/my_profit_page.dart)
* [消息中心](lib/ui/home/message_center_page.dart)
* [绑定手机号](lib/ui/login/bind_phone_page.dart)
* [登录](lib/ui/login/login_page.dart)
* [手机号登录](lib/ui/login/login_phone_page.dart)
* [商户后台管理](lib/ui/merchant/balance_background_page.dart)
* [商户后台核销](lib/ui/merchant/write_off_page.dart)
* [途乐会收银台](lib/ui/order/checkout_counter_page.dart) 
* [乐活订单下单](lib/ui/order/live_order_commit_page.dart)
* [订单详情](lib/ui/order/order_details_page.dart)
* [订单列表](lib/ui/order/order_list_page.dart)
* [设置](lib/ui/settings/settings_page.dart)
* [权限设置](lib/ui/settings/security/permission_handler_page.dart)
* [修改手机号](lib/ui/settings/security/security_change_phone.dart)
* [账户与安全](lib/ui/settings/security/security_page.dart)
* [用户协议](lib/ui/settings/protocol/user_protocol_page.dart)
* [关于app](lib/ui/settings/about/about_page.dart)  请将109行字符串换成关于app的文案
* [提现](lib/ui/withdraw/withdraw_page.dart)
* [提现记录](lib/ui/withdraw/withdraw_record_list_page.dart)
* [添加银行卡](lib/ui/withdraw/add_bank_card_page.dart)
* [支付成功页](lib/ui/pay_success_page.dart)

### 相关逻辑模型在目录[vm](lib/vm)中，根据ui文件名+**_ _provider.dart_** 寻找
### 本项目使用flutter和少量原生元素实现。

### 关于Flutter了解更多请参考

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a
full API reference.
