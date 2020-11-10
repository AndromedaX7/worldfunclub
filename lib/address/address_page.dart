import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/address/modify_address_page.dart';
import 'package:worldfunclub/bean/Response.dart';
import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/http/network.dart';

class AddressListPage extends StatefulWidget {
  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  @override
  void initState() {
    super.initState();
    _addressList();
  }

  List<AddressData> address = List();

  void _addressList() {
    api.addressList().listen((event) {
      var list = AddressList.fromJson(event);
      if (list.code == 1) {
        setState(() {
          address.addAll(list.data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("收货地址"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (b, i) => builtItem(address[i]),
          itemCount: address.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "添加收件地址",
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (b) => ModifyAddressPage(
                        modify: false,
                      )))
              .then((value) {
            address.clear();
            _addressList();
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void deleteAddress(String id) {
    showDialog(
        context: context,
        builder: (b) => AlertDialog(
              title: Text("删除收件地址"),
              content: Text("您确定要删除当前收件地址"),
              actions: [
                FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.of(context).pop(), //关闭对话框
                ),
                FlatButton(
                  child: Text("删除"),
                  onPressed: () {
                    api.deleteAddress(id).listen((event) {
                      var resp = R.fromJson(event);

                      if (resp.code == 1) {
                        Navigator.of(context).pop(true); //关闭对话框
                        address.clear();
                        _addressList();
                        Fluttertoast.showToast(msg: "删除成功");
                      } else {
                        Fluttertoast.showToast(msg: "${resp.msg}");
                      }
                    });
                    // ... 执行删除操作
                  },
                ),
                // SimpleDialogOption(
                //   onPressed: (){},
                //   child: Text("取消"),
                // ), SimpleDialogOption(
                //   onPressed: (){},
                //   child: Text("取消"),
                // )
              ],
            ));
  }

  Widget builtItem(AddressData data) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.w,
          ),
          GestureDetector(
            onLongPress: () => deleteAddress(data.addressId),
            child: Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Checkbox(
                  //   value: false,
                  //   onChanged: (v) {},
                  // ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 14.w,
                        ),
                        Row(
                          children: [
                            Text(
                              "${data.name}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                            Text(
                              "${data.phone}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            if (data.is_default == "2")
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.w, horizontal: 4.w),
                                child: Text(
                                  "默认",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFFF354D),
                                    Color(0xFFEB5F2B)
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.w)),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Text(
                            "${data.region.province}${data.region.city}${data.region.region}${data.detail}"),
                        SizedBox(
                          height: 24.w,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => editAddress(data),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void editAddress(AddressData data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => ModifyAddressPage(
                  modify: true,
                  address: data,
                ))).then((value) {
      address.clear();
      _addressList();
    });
  }
}
