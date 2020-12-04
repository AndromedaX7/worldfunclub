import 'package:json_annotation/json_annotation.dart';
import 'package:worldfunclub/bean/home_category.dart';
part 'mine.g.dart';
@JsonSerializable()
class MainBalance extends Resp{
  BalanceData data;
  MainBalance();
  factory MainBalance.fromJson(Map<String,dynamic>json)=>_$MainBalanceFromJson(json);
}
@JsonSerializable()
class BalanceData{
  String balance;

  BalanceData();
  factory BalanceData.fromJson(Map<String,dynamic>json)=>_$BalanceDataFromJson(json);
}

