import 'package:worldfunclub/providers.dart';

class PaySuccessPageProvider extends BaseProvider {
 final String orderId;
 final String orderType;
 final String pay;

  PaySuccessPageProvider(this.orderId,this.orderType,this.pay);
}