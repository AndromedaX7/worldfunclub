import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class AddressListPageProvider extends BaseProvider {
  List<AddressData> _address = [];

  List<AddressData> get address => _address;

  set address(List<AddressData> data) {
    _address = data;
    notifyListeners();
  }

  void list() {
    api.addressList().listen((event) {
      var list = AddressList.fromJson(event);
      if (list.code == 1) {
        address = list.data;
      }
    });
  }
}
