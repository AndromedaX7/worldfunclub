import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserCheckbox extends StatelessWidget {

  final bool check;
  UserCheckbox({this.check=false});
  @override
  Widget build(BuildContext context) {
    return check
        ? Image.asset(
      "images/ic_things_check.webp",
      fit: BoxFit.fill,width: 22.w,height: 22.w,
    )
        : Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.5.w),
        borderRadius: BorderRadius.circular(18.w),
      ),
      width: 22.w,
      height: 22.w,
    );
  }
}
