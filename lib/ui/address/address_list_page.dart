import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/Response.dart';
import 'package:worldfunclub/bean/address.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/address/modify_address_page.dart';
import 'package:worldfunclub/vm/address_list_page_provider.dart';

class AddressListPage extends ProviderWidget<AddressListPageProvider> {
  AddressListPage() : super();

  @override
  Widget buildContent(BuildContext context,mProvider) {
    return _AddressListPageContent(mProvider);
  }
}

class _AddressListPageContent extends StatefulWidget {
  final AddressListPageProvider provider;

  _AddressListPageContent(this.provider);

  @override
  _AddressListPageContentState createState() => _AddressListPageContentState();
}

class _AddressListPageContentState extends State<_AddressListPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.list();
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
          itemBuilder: (b, i) => builtItem(widget.provider.address[i]),
          itemCount: widget.provider.address.length,
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
            widget.provider.list();
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
                        widget.provider. list();
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
                            Flexible(
                              child: Text(
                                "${data.name}",maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16.sp),
                              ),
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
      widget.provider. list();
    });
  }
}
