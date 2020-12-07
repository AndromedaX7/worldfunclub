// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressList _$AddressListFromJson(Map<String, dynamic> json) {
  return AddressList()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AddressData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AddressListToJson(AddressList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) {
  return AddressData()
    ..addressId = json['address_id'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..provinceId = json['province_id'] as String
    ..cityId = json['city_id'] as String
    ..regionId = json['region_id'] as String
    ..district = json['district'] as String
    ..detail = json['detail'] as String
    ..userId = json['user_id'] as String
    ..region = json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>)
    ..isDefault = json['is_default'] as String;
}

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'name': instance.name,
      'phone': instance.phone,
      'province_id': instance.provinceId,
      'city_id': instance.cityId,
      'region_id': instance.regionId,
      'district': instance.district,
      'detail': instance.detail,
      'user_id': instance.userId,
      'region': instance.region,
      'is_default': instance.isDefault,
    };

DefaultAddress _$DefaultAddressFromJson(Map<String, dynamic> json) {
  return DefaultAddress()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : AddressData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DefaultAddressToJson(DefaultAddress instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region()
    ..province = json['province'] as String
    ..city = json['city'] as String
    ..region = json['region'] as String;
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'province': instance.province,
      'city': instance.city,
      'region': instance.region,
    };
