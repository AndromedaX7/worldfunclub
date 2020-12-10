import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/evaluation_page_provider.dart';
import 'package:worldfunclub/widgets/show_image_picker.dart';

class EvaluationPage extends ProviderWidget<EvaluationPageProvider> {
  EvaluationPage(String orderId, OrderGoods goods)
      : super(params: [orderId, goods]);

  @override
  Widget buildContent(BuildContext context, EvaluationPageProvider provider) {
    return _EvaluationPageContent(provider);
  }
}

class _EvaluationPageContent extends StatefulWidget {
  final EvaluationPageProvider provider;

  _EvaluationPageContent(this.provider);

  @override
  _EvaluationPageContentState createState() => _EvaluationPageContentState();
}

class _EvaluationPageContentState extends State<_EvaluationPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "发布",
        child: Icon(Icons.send,),
        onPressed: (){
          widget.provider.sendComment(context);
        },
      ),
      appBar: AppBar(
        title: Text("发表评价"),
        actions: [
          FlatButton(
            child: Text("发布",style: TextStyle(color: Colors.white),),
            onPressed: (){
              widget.provider.sendComment(context);
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.w),
                    child: Row(
                      children: [
                        Image.network(
                          widget.provider.goods.image,
                          width: 53.w,
                          height: 53.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.provider.goods.goods_name,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                            RatingBar.builder(
                                initialRating: widget.provider.star,
                                minRating: 1,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 20.w,
                                    ),
                                onRatingUpdate: (rating) {
                                  widget.provider.star = rating;
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: TextField(
                      onChanged: (s){
                        widget.provider.content=s;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit),
                          hintText: "从多个角度评价宝贝，可以帮助更多想要买的人",
                          border: InputBorder.none),
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 10,
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Container(
                      height: 120.w,
                      child: GridView.builder(
                        itemCount: widget.provider.images.length < 3
                            ? widget.provider.images.length + 1
                            : widget.provider.images.length,
                        itemBuilder: (c, i) => _imageList(
                            i,
                            widget.provider.images.length < 3
                                ? (i == 0
                                    ? null
                                    : widget.provider.images[i - 1])
                                : widget.provider.images[i]),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1, crossAxisCount: 3),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("匿名评价"),
                    trailing: CupertinoSwitch(
                      value: widget.provider.anonymous,
                      onChanged: (v) {
                        widget.provider.anonymous = v;
                      },
                      activeColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 32.w,
                  ),
                ],
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _imageList(int index, File path) {
    if (widget.provider.images.length < 3) {
      if (index == 0) {
        return InkWell(
          onTap: () {
            showImagePicker(context, (file) {
              widget.provider.addImages(File(file));
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
            color: Color(0xfffafafa),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black26,
                ),
                Text(
                  "上传凭证\n(最多3张)",
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
        );
      } else
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
          child: Image.memory(
            path.readAsBytesSync(),
            fit: BoxFit.fill,
          ),
        );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
        child: Image.memory(
          path.readAsBytesSync(),
          fit: BoxFit.fill,
        ),
      );
    }
  }
}
