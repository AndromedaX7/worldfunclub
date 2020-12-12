import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/bean/merchant.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/withdraw/add_bank_card_page.dart';
import 'package:worldfunclub/ui/withdraw/withdraw_record_list_page.dart';
import 'package:worldfunclub/vm/withdraw_page_provider.dart';
import 'package:worldfunclub/widgets/user_checkbox.dart';

class WithdrawPage extends ProviderWidget<WithdrawPageProvider> {
  WithdrawPage() : super();

  @override
  Widget buildContent(BuildContext context, WithdrawPageProvider provider) {
    return _WithdrawPageContent(provider);
  }
}

class _WithdrawPageContent extends StatefulWidget {
  final WithdrawPageProvider provider;

  _WithdrawPageContent(this.provider);

  @override
  _WithdrawPageContentState createState() => _WithdrawPageContentState();
}

class _WithdrawPageContentState extends State<_WithdrawPageContent> {
  String withdraw = "";
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: withdraw);
    widget.provider.loadList();
  }

  void _addBankCard(){
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>AddBankCardPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(brightness: Brightness.dark,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>WithdrawRecordListPage()));
            },
            child: Text(
              "提现记录",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        title: Text("提现"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _addBankCard();},
        child: Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 8.w),
            sliver: SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: 48.w,
                child: ListTile(
                  onTap: () { _addBankCard();},
                  leading: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                  title: Text(
                    "请添加银行卡",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 8.w, bottom: 16.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (c, i) => _bankItem(widget.provider.data[i],i),
                childCount: widget.provider.data.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.w)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, -4),
                        blurRadius: 4,
                        spreadRadius: 4)
                  ]),
              height: ((650.w) - widget.provider.cardCount * 50.w < 500.w)
                  ? 500.w
                  : (650.w) - widget.provider.cardCount * 50.w,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "提现金额",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: TextField(
                      controller: _controller,
                      onChanged: (s) {
                        withdraw = s.d.toStringAsFixed(2);
                      },
                      style: TextStyle(fontSize: 40.sp),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.money_yen),
                          hintText: "0.00"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "可提现金额¥1000.00",
                          style: TextStyle(color: Colors.black26),
                        ),
                        Spacer(),
                        FlatButton(
                          child: Text(
                            "全部提现",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                    ),
                    child: InkWell(
                      onTap: (){
                        widget.provider.withdraw(withdraw);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(21.w)),
                        height: 42.w,
                        child: Center(
                          child: Text(
                            "提现",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 Widget  _bankItem(BankListData data, int i) {
   return Container(
      color: Colors.white,
      height: 51.w,
      child: Column(
        children: [
          SizedBox(
            height: 50.w,
            child: ListTile(
              onTap: () {
                widget.provider.selectCard = i;
              },
              onLongPress: (){
                showDialog(context: context,builder: (c)=>AlertDialog(
                  title: Text("删除银行卡"),
                  actions: [
                    FlatButton(child: Text("取消"),onPressed: (){
                      Navigator.of(context).pop();
                    },),
                    FlatButton(child: Text("删除"),onPressed: (){
                      Navigator.of(context).pop();
                      widget.provider.delete(   data );
                    },),
                  ],
                ));
              },
              title: Text( "${ data .bankName}尾号(**${ data .bankCard.length>4? data.bankCard.substring( data .bankCard.length-4): data .bankCard})" ),
              trailing: UserCheckbox(
                check: widget.provider.selectCard == i,
              ),
            ),
          ),
          if (i + 1 < widget.provider.data.length)
            Container(
              height: 1.w,
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              color: Colors.black12,
            ),
        ],
      ),
    );
  }
}
