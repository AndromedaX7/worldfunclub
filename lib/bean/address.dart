import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressList extends Resp {
  List<AddressData> data;

  AddressList();

  factory AddressList.fromJson(Map<String, dynamic> json) =>
      _$AddressListFromJson(json);

  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}

@JsonSerializable()
class AddressData {
  AddressData();

  @JsonKey(name: "address_id")
  String addressId;
  String name;
  String phone;
  @JsonKey(name: "province_id")
  String provinceId;
  @JsonKey(name: "city_id")
  String cityId;
  @JsonKey(name: "region_id")
  String regionId;
  String district;
  String detail;
  @JsonKey(name: "user_id")
  String userId;
  Region region;
  @JsonKey(name: "is_default")
  String isDefault;

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}

@JsonSerializable()
class DefaultAddress extends Resp {
  DefaultAddress();

  factory DefaultAddress.fromJson(Map<String, dynamic> json) =>
      _$DefaultAddressFromJson(json);
  AddressData data;

  Map<String, dynamic> toJson() => _$DefaultAddressToJson(this);
}

@JsonSerializable()
class Region {
  Region();

  String province;
  String city;
  String region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
