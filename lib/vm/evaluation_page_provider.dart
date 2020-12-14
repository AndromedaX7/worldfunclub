import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/providers.dart';

class EvaluationPageProvider extends BaseProvider {
  final String orderId;
  final OrderGoods goods;

  EvaluationPageProvider(this.orderId, this.goods);

  List<File> _images = [];
  String _content;
  double _star = 4;
  bool _anonymous = true;

  List<File> get images => _images;

  String get content => _content;

  double get star => _star;

  bool get anonymous => _anonymous;

  set images(List<File> ll) {
    _images = ll;
    notifyListeners();
  }

  set content(String string) {
    _content = string;
    notifyListeners();
  }

  set star(double string) {
    _star = string;
    notifyListeners();
  }

  set anonymous(bool string) {
    _anonymous = string;
    notifyListeners();
  }

  void addImages(File file) {
    _images.add(file);
    notifyListeners();
  }

  void sendComment(BuildContext context) {
    showDialog(context: context,builder: (c)=>AlertDialog(
      title: Text("请稍候"),
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 16.w,),
          Text("正在上传您的评价")
        ],
      ),
    ),barrierDismissible: false);
    api.saveComment( images   , orderId, goods.goodsId, content, star, anonymous).listen((event) {
      Navigator.of(context).pop();
      var resp = EmptyDataResp.fromJson(event);
      if(resp.code ==1){
        Navigator.of(context).pop(true);
        Fluttertoast.showToast(msg: "评价成功");

      }else{
        Fluttertoast.showToast(msg: resp.msg);
      }
    });
  }
}
