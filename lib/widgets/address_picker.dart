import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/region.dart';

class AddressPicker extends StatefulWidget {
  final void Function(String address, String pid, String cid, String rid)
      onCallback;

  AddressPicker(this.onCallback);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker>
    with SingleTickerProviderStateMixin {
  String p = "", c = "", r = "";
  String pid = "", cid = "", rid = "";
  int _index = 0;
  TabController _tabController;
  List<RegionInfo> region = List();
  List<RegionInfo> parent = List( );

  List<RegionInfo> selected = List();

  @override
  void initState() {
    rootBundle.loadString("assets/region.json").then((value) {
      setState(() {
        region.addAll(RegionData.fromJson(json.decode(value)).data);
        selected.addAll(region);
      });
    });
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 360.w,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              onTap: (i) {
                switch (i) {
                  case 0:
                    if (p.isNotEmpty) {
                      setState(() {
                        parent.clear();
                        selected.clear();
                        selected.addAll(region);
                        p="";
                        c="";
                        r="";
                      });
                    }
                    break;
                  case 1:
                    if (c.isNotEmpty) {
                      setState(() {
                        parent.removeLast();
                        selected.clear();
                        selected.addAll(parent.last.children);
                        c="";
                        r="";
                      });
                    }
                    break;

                }
              },
              labelColor: Colors.red,
              controller: _tabController,
              tabs: [
                Tab(text: pText()),
                Tab(text: cText()),
                Tab(text: rText()),
              ],
            ),
            Container(
                height: 300.w,
                child: ListView.builder(
                  itemCount: selected.length,
                  itemBuilder: (c, i) => ListTile(
                    title: Text("${selected[i].name}"),
                    onTap: () {
                      setTabText(selected[i]);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void setTabText(RegionInfo info) {
    var index = _tabController.index;
    switch (index) {
      case 0:
        p = info.name;
        pid = info.id;
        break;
      case 1:
        c = info.name;
        cid = info.id;
        break;
      case 2:
        rid = info.id;
        r = info.name;
        break;
    }
    _index = _tabController.index;
    if (index + 1 <= 2) {
      _tabController.index = index + 1;
    } else if (index + 1 > 2) {
      widget.onCallback("$p$c$r", pid, cid, rid);
      Navigator.of(context).pop();
    }
    setState(() {
      if (info.children != null && info.children.isNotEmpty) {
        parent.add(info);
        selected.clear();
        selected.addAll(info.children);
      }
    });
  }

  String pText() {
    if (p.isEmpty) {
      return "请选择";
    } else {
      return p;
    }
  }

  String cText() {
    if (p.isEmpty) {
      return "";
    } else {
      if (c.isEmpty) {
        return "请选择";
      } else {
        return c;
      }
    }
  }

  String rText() {
    if (c.isEmpty) {
      return "";
    } else {
      if (r.isEmpty) {
        return "请选择";
      } else {
        return r;
      }
    }
  }
}
