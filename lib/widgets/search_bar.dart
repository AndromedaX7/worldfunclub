
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/item_tile.dart';
class SearchBar extends StatefulWidget {

  final OnTap onTap;

  SearchBar(this.onTap);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          width: double.infinity,
          height: 36,
          padding: EdgeInsets.only(left: 16.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(16.w))
          ),
          child: Row(
            children: [
              Icon(Icons.search,color: Color(0xFF999999)),
              Text("搜索商品名称",style: TextStyle(color: Color(0xFF999999)),),
            ],
          )
      ),
    );
  }
}
