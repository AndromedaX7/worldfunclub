import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/Response.dart';
import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/widgets/address_picker.dart';

class ModifyAddressPage extends StatefulWidget {
  final bool modify;
  final AddressData address;

  ModifyAddressPage({this.modify = false, this.address});

  @override
  _ModifyAddressPageState createState() => _ModifyAddressPageState();
}

class _ModifyAddressPageState extends State<ModifyAddressPage> {
  var key = GlobalKey<FormState>();
  AddressData address;
  bool checkDefault = false;
  String receiveName = "";
  String receivePhone = "";
  String receiveAddress = "";
  String provinceId = "";
  String cityId = "";
  String regionId = "";
  String region = "";

  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _detailsAddress;

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.address != null) {
      address = widget.address;
      receiveName = address.name;
      receivePhone = address.phone;
      receiveAddress = address.detail;
      _nameController = TextEditingController(text: receiveName);
      _phoneController = TextEditingController(text: receivePhone);
      _detailsAddress = TextEditingController(text: receiveAddress);
      checkDefault = "2" == address.is_default;
      provinceId = address.province_id;
      cityId = address.city_id;
      regionId = address.region_id;
      region =
      "${address.region.province}${address.region.city}${address.region.region}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(title: Text(widget.modify ? "修改收货地址" : "添加收货地址")),
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "收货人",
                            hintText: "请填写收货人姓名",
                            errorText: "",
                            counterText: receiveName.length.toString(),
                          ),
                          onChanged: changeReceiveName,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: TextFormField(
                          controller: _phoneController,
                          onChanged: changeReceivePhone,
                          decoration: InputDecoration(
                              labelText: "手机号码",
                              hintText: "请填写收货人手机号",
                              counterText: receivePhone.length.toString()),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          padding: EdgeInsets.only(left: 14.w),
                          width: double.infinity,
                          height: 40.w,
                          child: Row(
                            children: [
                              Text(
                                "所在地区：",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(region == null || region == ""
                                  ? "点击选择地区"
                                  : region),
                            ],
                          ),
                        ),
                        onPressed: () {
                          _showBottomSheet();
                        },
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: TextFormField(
                          controller: _detailsAddress,
                          maxLines: 4,
                          onChanged: changeReceiveAddress,
                          decoration: InputDecoration(
                            labelText: "详细地址",
                            hintText: "请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元室等",
                            errorText: "",
                            counterText: receiveAddress.length.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 4.w, horizontal: 14.w),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text("设为默认收货地址"),
                      Spacer(),
                      CupertinoSwitch(
                        value: checkDefault,
                        onChanged: (v) {
                          setState(() {
                            checkDefault = !checkDefault;
                          });
                        },
                        activeColor: Color(0xFFE33541),
                        trackColor: Color(0xFFE9E9EB),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          if (widget.modify && widget.address != null) {
            editAddress();
          } else {
            addNewAddress();
          }
        },
        tooltip: "保存",
      ),
    );
  }

  void editAddress() {
    api
        .editAddress(address.addressId, "$provinceId,$cityId,$regionId",
        receiveName, receivePhone, receiveAddress, checkDefault)
        .listen((event) {
      R resp = R.fromJson(event);
      if (resp.code == 1) {
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(
          msg: "${resp.msg}", toastLength: Toast.LENGTH_SHORT);
    });
  }

  void addNewAddress() {
    api.addAddress("$provinceId,$cityId,$regionId", receiveName, receivePhone,
        receiveAddress, checkDefault)
        .listen((event) {
      R resp = R.fromJson(event);
      if (resp.code == 1) {
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(
          msg: "${resp.msg}", toastLength: Toast.LENGTH_SHORT);
    });
  }

  void _showBottomSheet() {
    scaffoldState.currentState.showBottomSheet(
          (c) => AddressPicker((a, p, c, r) {
        setState(() {
          region = a;
          provinceId = p;
          cityId = c;
          regionId = r;
        });
      }),
      elevation: 4.0,
    );
  }

  void getRegion() {}

  void changeReceiveName(String value) {
    setState(() {
      this.receiveName = value;
    });
  }

  void changeReceiveAddress(String value) {
    setState(() {
      this.receiveAddress = value;
    });
  }

  void changeReceivePhone(String value) {
    setState(() {
      this.receivePhone = value;
    });
  }
}
