import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/providers.dart';

class WriteOffPageProvider extends BaseProvider {
  final String code;

  WriteOffPageProvider(this.code);

  String _orderId="";
  String _writeOff="";
  String _orderNo="";
  String _totalNum="";
  String _name="";
  String _goodsName="";
  String _writeOffNum="";
  String _phone="";
  String _date="";


  String get orderId=>_orderId;
  String get writeOff=>_writeOff;
  String get orderNo=>_orderNo;
  String get totalNum=>_totalNum;
  String get name=>_name;
  String get goodsName=>_goodsName;
  String get writeOffNum=>_writeOffNum;
  String get phone=>_phone;
  String get date=>_date;

  set orderId(String str){
    _orderId=str;
    notifyListeners();
  }
  set writeOff(String str){
    _writeOff=str;
    notifyListeners();
  }
  set orderNo(String str){
    _orderNo=str;
    notifyListeners();
  }
  set totalNum(String str){
    _totalNum=str;
    notifyListeners();
  }
  set name(String str){
    _name=str;
    notifyListeners();
  }
  set goodsName(String str){
    _goodsName=str;
    notifyListeners();
  }
  set writeOffNum(String str){
    _writeOffNum=str;
    notifyListeners();
  }
  set phone(String str){
    _phone=str;
    notifyListeners();
  }
  set date(String str){
    _date=str;
    notifyListeners();
  }

  void loadScanInfo() {
    if (code.startsWith("http"))
      api.loadScanInfo(code).listen((e) {
        try{
          var resp = ScanInfoResp.fromJson(e);
          if (resp.code == 1) {
            orderId = resp.data.orderId;
            writeOff = resp.data.writeOff;
            orderNo = resp.data.orderNo;
            totalNum = resp.data.totalNum;
            name = resp.data.name;
            goodsName = resp.data.goodsName;
            writeOffNum = resp.data.writeOffNum;
            phone = resp.data.phone;
            date = "${resp.data.startTime}-${resp.data.endTime}";
          } else {
            Fluttertoast.showToast(msg: resp.msg);
            App.navigatorKey.currentState.pop();
          }
        }catch(e){
          Fluttertoast.showToast(msg:"您扫描的核销码不正确");
          App.navigatorKey.currentState.pop();
        }
      });
    else{
      Fluttertoast.showToast(msg:"您扫描的核销码不正确");
      App.navigatorKey.currentState.pop();
    }
  }

  void writeOffOrder() {
    api.writeOff(orderId).listen((event) {
      var resp = ShopBalanceResp.fromJson(event);
      if(resp.code ==1){
        Fluttertoast.showToast(msg: "核销成功");
        App.navigatorKey.currentState.pop();
      }else{
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }
}
