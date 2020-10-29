import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void initDesignSize(BuildContext context, double width, double height) {
  ScreenUtil.init(context,
      designSize: Size(width, height), allowFontScaling: false);
}

void initDefaultDesignSize(BuildContext context) {
  ScreenUtil.init(context, designSize: Size(375, 667), allowFontScaling: false);
}
