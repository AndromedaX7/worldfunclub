import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget initDesignSize(
     double width, double height, Widget app) {
  return ScreenUtilInit(
    child: app,
    designSize: Size(width, height),
    allowFontScaling: false,
  );
}

Widget initDefaultDesignSize(Widget app) {
  return ScreenUtilInit(
      child: app, designSize: Size(375, 667), allowFontScaling: false);
}
