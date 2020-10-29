import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/widgets/item_tile.dart';

class MineOrderIconButton extends StatelessWidget {
  final OnTap onTap;
  final String title;
  final String assetsName;

  final num width;
  final num height;
  final num fontSize;
  MineOrderIconButton(this.title, this.assetsName, this.onTap,{this.width=26,this.height=26,this.fontSize=12});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 14.w,
          ),
          Image.asset(assetsName,width: width.w,height: height.w, ),
          SizedBox(
            height: 6.w,
          ),
          Text(
            title,
            style: TextStyle(fontSize: fontSize.sp),
          ),
          SizedBox(
            height: 6.w,
          ),
        ],
      ),
    );
  }
}
