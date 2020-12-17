import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/order.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/after_sale_details_page_provider.dart';

class AfterSaleDetailsPage
    extends ProviderWidget<AfterSaleDetailsPageProvider> {
  AfterSaleDetailsPage(RefundListData orderRefundId, String type)
      : super(params: [orderRefundId, type]);

  @override
  Widget buildContent(
      BuildContext context, AfterSaleDetailsPageProvider provider) {
    return _AfterSaleDetailsPageContent(provider);
  }
}

class _AfterSaleDetailsPageContent extends StatefulWidget {
  final AfterSaleDetailsPageProvider provider;

  _AfterSaleDetailsPageContent(this.provider);

  @override
  _AfterSaleDetailsPageContentState createState() =>
      _AfterSaleDetailsPageContentState();
}

class _AfterSaleDetailsPageContentState
    extends State<_AfterSaleDetailsPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("售后详情"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              margin: EdgeInsets.symmetric(vertical: 8.w),
              height: 60.w,
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(widget.provider.orderRefund.refundStatus == "10"
                      ? "images/ic_refund_no.webp"
                      : "images/ic_refund_yes.webp"),
                  SizedBox(
                    width: 18.w,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.provider.data.speedText ?? ""}",
                          style: TextStyle(
                              fontSize: 16.w,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text("${widget.provider.data.refuseDesc ?? ""}")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 8.w),
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 32.w),
              color: Colors.white,
              child: Text(
                "售后商品",
                style: TextStyle(
                    fontSize: 16.w,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: goodsList(),
          ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 8.w),
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 32.w),
                color: Colors.white,
                child: Text(
                  "卖家收件地址",
                  style: TextStyle(
                      fontSize: 16.w,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 32.w),
                color: Colors.white,
                child: Text(
                  "${widget.provider.data.sellerAddress}",
                  style: TextStyle(
                    fontSize: 14.w,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 8.w),
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 32.w),
                color: Colors.white,
                child: Text(
                  "填写物流",
                  style: TextStyle(
                      fontSize: 16.w,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty &&
              widget.provider.data.expressId != null &&
              widget.provider.data.expressId.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "物流公司",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: Text("${widget.provider.data.expressName}"),
                    ),
                    Container(
                      height: 1.w,
                      color: Colors.black12,
                    ),
                    ListTile(
                      leading: Text(
                        "物流单号",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      title: Text("${widget.provider.data.expressNo}"),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    Container(
                      height: 1.w,
                      color: Colors.black12,
                    ),
                    ListTile(
                      leading: Text(
                        "联系电话",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      title: Text(widget.provider.data.userMobile),
                      contentPadding: EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty &&
              widget.provider.data.expressId != null &&
              widget.provider.data.expressId.isEmpty)
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (c) => StatefulBuilder(
                                  builder: (c, state) => Container(
                                    height: 500.w,
                                    child: ListView.builder(
                                      itemCount:
                                          widget.provider.expressList.length,
                                      itemBuilder: (c, i) => ListTile(
                                        onTap: () {
                                          state(() {
                                            widget.provider.expressName = widget
                                                .provider
                                                .expressList[i]
                                                .caption;
                                            widget.provider.expressId = widget
                                                .provider.expressList[i].id;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        title: Text(
                                          "${widget.provider.expressList[i].caption}",
                                          style: TextStyle(
                                              color:
                                                  widget.provider.expressName ==
                                                          widget
                                                              .provider
                                                              .expressList[i]
                                                              .caption
                                                      ? Colors.red
                                                      : Colors.black87),
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      leading: Text(
                        "物流公司",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black26,
                      ),
                      title: Text(
                          "${widget.provider.expressName.isEmpty ? "点击选择物流公司" : widget.provider.expressName}"),
                    ),
                    Container(
                      height: 1.w,
                      color: Colors.black12,
                    ),
                    ListTile(
                      leading: Text(
                        "物流单号",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      title: TextField(
                        onChanged: (s) {
                          widget.provider.expressNo = s;
                        },
                        decoration: InputDecoration(
                            hintText: "请填写物流单号", border: InputBorder.none),
                      ),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    Container(
                      height: 1.w,
                      color: Colors.black12,
                    ),
                    ListTile(
                      leading: Text(
                        "联系电话",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                      title: TextField(
                        onChanged: (s) {
                          widget.provider.phone = s;
                        },
                        decoration: InputDecoration(
                            hintText: "请填写联系电话", border: InputBorder.none),
                      ),
                      contentPadding: EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.provider.data.sellerAddress != null &&
              widget.provider.data.sellerAddress.isNotEmpty &&
              widget.provider.data.expressId != null &&
              widget.provider.data.expressId.isEmpty)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
                child: InkWell(
                  onTap: () {
                    widget.provider.commitDelivery(context);
                  },
                  child: Container(
                    height: 42.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.w),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        "我已发货",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget goodsList() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 32.w),
      child: Row(
        children: [
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.provider.orderRefund.goodsImage,
                  ),
                ),
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: Colors.black12)),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Container(
              height: 90.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.provider.orderRefund.goodsName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black87, fontSize: 14.sp)),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text(
                    "${widget.provider.orderRefund.goodsAttr}",
                    style: TextStyle(color: Colors.black38, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
