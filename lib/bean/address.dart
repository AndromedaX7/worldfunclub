import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'address.g.dart';

@JsonSerializable()
class AddressList extends Resp{
  List<AddressData> data;
  AddressList();
  factory AddressList.fromJson(Map<String,dynamic> json )=>_$AddressListFromJson(json);
}
@JsonSerializable()
class AddressData{
  AddressData();
  @JsonKey(name: "address_id") String addressId;
  String name;
  String phone;
  String province_id;
  String city_id;
  String region_id;
  String district;
  String detail;
  String user_id;
  Region region;
  String is_default;

  factory AddressData.fromJson(Map<String,dynamic> json )=>_$AddressDataFromJson(json);
}

@JsonSerializable()
class DefaultAddress  extends Resp{
  DefaultAddress();
  factory DefaultAddress.fromJson(Map<String,dynamic> json )=>_$DefaultAddressFromJson(json);
  AddressData  data;
}
@JsonSerializable()
class Region{
  Region();
  String province;
  String city;
  String region;

  factory Region.fromJson(Map<String,dynamic> json )=>_$RegionFromJson(json);
}