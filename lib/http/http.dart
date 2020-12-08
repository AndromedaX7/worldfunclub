import 'dart:convert';

import 'package:dartin/dartin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worldfunclub/bean/Response.dart' show R;
import 'package:worldfunclub/main.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';

Dio dio = Dio();

Future _get(String url,
        {Map<String, dynamic> params, Map<String, dynamic> headers}) =>
    _interceptorGet(url, params: params, headers: headers);

Future _post(String url,
        {Map<String, dynamic> params, Map<String, dynamic> headers}) =>
    _interceptorPost(url, params: params, headers: headers);

Future _post2(String url, {dynamic params, Map<String, dynamic> headers}) =>
    _interceptorPost2(url, params: params, headers: headers);

Stream post(String url,
        {Map<String, dynamic> params, Map<String, dynamic> headers}) =>
    Stream.fromFuture(_post(url, params: params, headers: headers))
        .asBroadcastStream();

Stream post2(String url, {dynamic params, Map<String, dynamic> headers}) =>
    Stream.fromFuture(_post2(url, params: params, headers: headers))
        .asBroadcastStream();

Stream get(String url,
        {Map<String, dynamic> params, Map<String, dynamic> headers}) =>
    Stream.fromFuture(_get(url, params: params, headers: headers))
        .asBroadcastStream();

Future _interceptorGet(String url,
    {Map<String, dynamic> params, Map<String, dynamic> headers}) async {
  var response = await dio.get(url,
      queryParameters: params, options: Options(headers: headers));
  if (response.data is String) {
    response.data = json.decode(response.data);
  }
  if (R.fromJson(response.data).code == -99) {
    callPop();
    return response.data;
  } else
    return response.data;
}

callPop() async {
//  homeProvider.userState = 0;

  showDialog(
      context: App.mainKey.currentContext,
      barrierDismissible: false,
      builder:(c)=> SimpleDialog(
        title: Text("您的账号在其他设备上登录"),
        children: <Widget>[
          SimpleDialogOption(
            child: Text("即将自动返回登录界面"),
          )
        ],
      ));
  await Future.delayed(Duration(seconds: 3));
  while (App.navigatorKey.currentState.canPop()) {
    App.navigatorKey.currentState.pop();
  }

  inject<MainUiProvider>().state = MainState.Login ;
  // LocalChannel.launchPlatform("login");
}

Future _interceptorPost(String url,
    {Map<String, dynamic> params, Map<String, dynamic> headers}) async {
  printUrlWithArgs(url, params);
  var response = await dio.post(url,
      queryParameters: params, options: Options(headers: headers));
  if (response.data is String) {
    response.data = json.decode(response.data);
  }
  Log.d(response.data);
  if (R.fromJson(response.data).code == -99) {
    callPop();
    return response.data;
  } else
    return response.data;
}

Future _interceptorPost2(String url,
    {dynamic params, Map<String, dynamic> headers}) async {
  printUrlWithArgs(url, params);
  var response =
      await dio.post(url, data: params, options: Options(headers: headers));
  if (response.data is String) {
    response.data = json.decode(response.data);
  }
  Log.d(response.data);
  if (R.fromJson(response.data).code == -99) {
    callPop();
    return response.data;
  } else
    return response.data;
}

Future _formData(String url, FormData data,
    {Map<String, dynamic> headers}) async {
  var response =
      await dio.post(url, data: data, options: Options(headers: headers));
  if (response.data is String) {
    response.data = json.decode(response.data);
  }
  Log.d(response.data);
  if (R.fromJson(response.data).code == -99) {
    callPop();
    return response.data;
  } else
    return response.data;
}

Stream formData(String url, FormData data, {Map<String, dynamic> headers}) =>
    Stream.fromFuture(_formData(url, data, headers: headers))
        .asBroadcastStream();

void printUrlWithArgs(String url, Map<String, dynamic> params) {
  StringBuffer sb = StringBuffer();
  if (params != null)
    params.forEach((key, value) {
      sb.write("$key=$value&");
    });
  Log.v("$url?$sb");
}

String htmlTransform(String content) {
  return content
      .replaceAll("&lt;", "<")
      .replaceAll("&gt;", ">")
      .replaceAll("&amp;", "&")
      .replaceAll("&quot;", "\"");
}
