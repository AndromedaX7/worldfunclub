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
    ..province_id = json['province_id'] as String
    ..city_id = json['city_id'] as String
    ..region_id = json['region_id'] as String
    ..district = json['district'] as String
    ..detail = json['detail'] as String
    ..user_id = json['user_id'] as String
    ..region = json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>)
    ..is_default = json['is_default'] as String;
}

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'name': instance.name,
      'phone': instance.phone,
      'province_id': instance.province_id,
      'city_id': instance.city_id,
      'region_id': instance.region_id,
      'district': instance.district,
      'detail': instance.detail,
      'user_id': instance.user_id,
      'region': instance.region,
      'is_default': instance.is_default,
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
